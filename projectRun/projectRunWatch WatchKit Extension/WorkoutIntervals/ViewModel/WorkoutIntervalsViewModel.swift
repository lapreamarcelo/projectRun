//
//  WorkoutIntervalsViewModel.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Marcelo Laprea on 6/11/21.
//

import Combine
import SwiftUI

class WorkoutIntervalsViewModel: ObservableObject {
    @Published var workoutManager: WorkoutManager
    @Published var shouldStartRest: Bool = false
    
    private var total: Double = 100
    
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
            .sink { [weak self] distance in
                self?.checkDistante(distance: distance)
            }
            .store(in: &subscriptions)
    }
    
    func checkDistante(distance: Double) {
        if distance >= total {
            shouldStartRest = true
            print("AJA")
        }
    }
}
