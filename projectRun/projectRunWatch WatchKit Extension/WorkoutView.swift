//
//  WorkoutView.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Marcelo Laprea on 6/11/21.
//

import SwiftUI

struct WorkoutView: View {
    @ObservedObject var workoutManager = WorkoutManager()
    
    var body: some View {
        WorkoutOngoingView(workoutManager: workoutManager)
            .onAppear {
                workoutManager.authorizeHealthKit()
            }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
