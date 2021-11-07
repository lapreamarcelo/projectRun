//
//  WorkoutOngoingView.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Marcelo Laprea on 6/11/21.
//

import SwiftUI

struct WorkoutOngoingView: View {
    var workoutManager: WorkoutManager
    var workout: Workout
    @State private var selection: Tab = .workoutDetail
    
    var body: some View {
        TabView(selection: $selection) {
            WorkoutControlsView(workoutManager: workoutManager).tag(Tab.controls)
            WorkoutIntervalsView(viewModel: WorkoutIntervalsViewModel(workoutManger: workoutManager, workout: workout)).tag(Tab.workoutDetail)
        }
        .onAppear {
            workoutManager.startWorkout()
        }
    }
}

private extension WorkoutOngoingView {
    enum Tab {
        case controls
        case workoutDetail
    }
}

struct WorkoutOngoingView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutOngoingView(workoutManager: WorkoutManager(), workout: Workout(name: "", series: []))
    }
}
