//
//  WorkoutView.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Sebastian Fernandez on 06/11/2021.
//  Created by Marcelo Laprea on 6/11/21.
//

import SwiftUI

struct WorkoutView: View {
    @EnvironmentObject private var workoutManager: WorkoutManager

    var body: some View {
        WorkoutListView()
            .onAppear {
                workoutManager.authorizeHealthKit()
            }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListView()
    }
}
