//
//  WorkoutListView.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Libranner Leonel Santos Espinal on 6/11/21.
//

import SwiftUI

struct WorkoutListView: View {
  @EnvironmentObject private var viewModel: WorkoutListViewModel

  var body: some View {
    NavigationView {
      List(viewModel.workouts) { workout in
          NavigationLink(destination: StartWorkout(workout: workout)) {
          Text(workout.name)
            .font(.body)
            .foregroundColor(.primary)
        }
      }
      .navigationTitle("Workouts")
    }
  }
}

struct WorkoutListView_Previews: PreviewProvider {
  static var previews: some View {
    WorkoutListView()
  }
}
