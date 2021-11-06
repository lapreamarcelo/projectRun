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
    @Published var currentTime: TimeInterval = TimeInterval(0)
    
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
        
        start().sink { seconds in
            self.currentTime = TimeInterval(seconds)
        }
        .store(in: &subscriptions)
    }
    
    func start() -> AnyPublisher<Int, Never> {
        timer.autoconnect()
            .map { [weak self] _ in
                guard let self = self else { return 0 }

                let calendar = Calendar(identifier: .gregorian)
                let components = calendar
                    .dateComponents([.second]
                                    ,from: self.startedAt,
                                    to: Date())

                return components.second ?? 0
        }.eraseToAnyPublisher()
    }
    
    func checkDistante(distance: Double) {
        if distance >= total {
            shouldStartRest = true
        }
    }
    
    func calculatePace(distance: Double) {
        if currentTime == 0 {
            return
        }
        
        let currentPace = (1000 * currentTime) / distance
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        
        guard let formattedPace = formatter.string(from: TimeInterval(currentPace)) else { return }
    
        self.pace = formattedPace
    }
}
