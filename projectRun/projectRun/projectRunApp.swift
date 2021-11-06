//
//  projectRunApp.swift
//  projectRun
//
//  Created by Libranner Leonel Santos Espinal on 5/11/21.
//

import SwiftUI

@main
struct projectRunApp: App {
    var body: some Scene {
        WindowGroup {
          #if os(watchOS)
            WorkoutView()
          #endif

          #if os(iOS)
            TabView {
              WorkoutsView()
                .tabItem {
                  Image(systemName: "bolt.horizontal")
                  Text("Workouts")
                }
              WorkoutsView()
                .tabItem {
                  Image(systemName: "figure.walk")
                  Text("Start")
                }
              ActivityView()
                .tabItem {
                  Image(systemName: "square.fill.text.grid.1x2")
                  Text("Activity")
                }
            }
            .onAppear {
              UITabBar.appearance().backgroundColor = .white
            }
          #endif
        }
    }
}
