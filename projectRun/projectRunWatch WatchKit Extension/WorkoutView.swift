//
//  WorkoutView.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Sebastian Fernandez on 06/11/2021.
//

import SwiftUI

struct WorkoutView: View {
    var body: some View {
        WorkoutIntervalsView(viewModel: WorkoutIntervalsViewModel(workoutManger: WorkoutManager()))
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
