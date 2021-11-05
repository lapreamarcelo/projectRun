//
//  ContentView.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Marcelo Laprea on 5/11/21.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    @ObservedObject var workoutManager = WorkoutManager()
    
    var body: some View {
        MetricsView(workoutManager: workoutManager)
            .onAppear {
                workoutManager.authorizeHealthKit()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
