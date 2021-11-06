//
//  WorkoutIntervalsViewModel.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Marcelo Laprea on 6/11/21.
//

import SwiftUI

class WorkoutIntervalsViewModel: ObservableObject {
    @Published var workoutManager: WorkoutManager
    
    init(workoutManger: WorkoutManager) {
        self.workoutManager = workoutManger
    }
}
