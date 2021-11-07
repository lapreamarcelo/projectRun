//
//  WorkoutOngoingView.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Marcelo Laprea on 6/11/21.
//

import SwiftUI

struct WorkoutOngoingView: View {
    @EnvironmentObject private var workoutManager: WorkoutManager
    @State private var selection: Tab = .workoutDetail
    let workout: Workout
    
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
        WorkoutOngoingView(workout: Workout(name: "", series: []))
    }
}
