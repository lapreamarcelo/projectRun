//
//  WorkoutIntervalsViewModel.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Marcelo Laprea on 6/11/21.
//

import Combine
import HealthKit
import SwiftUI

class WorkoutIntervalsViewModel: ObservableObject {
    @Published var workoutManager: WorkoutManager
    @Published var shouldStartRest: Bool = false
    @Published var pace: String = "00:00"
    @Published var currentSeconds: Int = 0
    
    private var startedAt = Date()
    private var total: Double = 100
    private var timer = Timer.publish(every: 1, on: .main, in: .default)
    
    private var subscriptions: Set<AnyCancellable> = []
    
    init(workoutManger: WorkoutManager) {
        self.workoutManager = workoutManger
        setup()
    }
}

private extension WorkoutIntervalsViewModel {
    func setup() {
        workoutManager
            .$distance
            .sink { [weak self] distance in
                self?.calculatePace(distance: distance)
                self?.checkDistante(distance: distance)
            }
            .store(in: &subscriptions)
        
        workoutManager
            .$running
            .sink { [weak self] isRunning in
                #warning("NEED TO REACTIVATE THIS TIMER SOMEHOW")
                if !isRunning {
                    self?.timer.connect().cancel()
                }
            }
            .store(in: &subscriptions)
        
        timer
            .autoconnect()
               .sink { _ in
                   print(self.currentSeconds)
                   self.currentSeconds += 1
               }
               .store(in: &subscriptions)
    }
    
    func checkDistante(distance: Double) {
        if distance >= total {
            shouldStartRest = true
        }
    }
    
    func calculatePace(distance: Double) {
        if currentSeconds == 0 {
            return
        }
        
        let currentPace = (1000 * Double(currentSeconds)) / distance
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        
        guard let formattedPace = formatter.string(from: TimeInterval(currentPace)) else { return }
    
        self.pace = formattedPace
    }
}
