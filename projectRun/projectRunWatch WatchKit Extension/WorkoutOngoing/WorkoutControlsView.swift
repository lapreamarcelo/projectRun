//
//  WorkouttControlsView.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Marcelo Laprea on 6/11/21.
//

import SwiftUI

struct WorkoutControlsView: View {
    var workoutManager: WorkoutManager
    
    var body: some View {
        HStack {
            VStack {
                Button {
                    workoutManager.endWorkout()
                } label: {
                    Image(systemName: "xmark")
                }
                .tint(.red)
                .font(.title2)
                Text("End")
            }
            VStack {
                Button {
                    workoutManager.togglePause()
                } label: {
                    Image(systemName: workoutManager.running ? "pause" : "play")
                }
                .tint(.yellow)
                .font(.title2)
                Text(workoutManager.running ? "Pause" : "Play")
            }
        }
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutControlsView(workoutManager: WorkoutManager())
    }
}

