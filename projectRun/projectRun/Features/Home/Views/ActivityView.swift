//
//  HomeView.swift
//  projectRun
//
//  Created by Libranner Leonel Santos Espinal on 6/11/21.
//

import SwiftUI

struct ActivityView: View {
  let workouts = [Workout.dummyWorkout(), Workout.dummyWorkout()]

  var body: some View {
    NavigationView {
      List {
        ForEach(workouts) { _ in
          Section(header: ActivityHeader(date: Date(), distance: 100.00).textCase(.lowercase)) {
            StatsSummaryView()
              .padding(5)
              .listRowSeparator(.hidden)
          }
        }
      }
      .navigationTitle("Latest Runs")
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    ActivityView()
  }
}
