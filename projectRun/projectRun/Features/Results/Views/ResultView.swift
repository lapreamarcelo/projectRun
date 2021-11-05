//
//  ResultView.swift
//  projectRun
//
//  Created by Libranner Leonel Santos Espinal on 5/11/21.
//

import SwiftUI

struct ResultView: View {
  var body: some View {
    VStack(alignment: .leading) {
      Text("Yesterday at 15:00")
      Text("5.23 Kms")
        .font(.largeTitle)

      HStack {
        VStack(spacing: 20) {
          VStack {
            Label("Avg. Heart Rate", systemImage: "heart")
              .foregroundColor(.secondary)
            Text("145")
          }

          VStack {
            Label("Avg. Pace", systemImage: "figure.walk")
              .foregroundColor(.secondary)
            Text("145")
          }
        }
        Spacer()
        VStack(spacing: 20) {
          VStack {
            Label("Calories", systemImage: "flame")
              .foregroundColor(.secondary)
            Text("145")
          }
          VStack {
            Label("Time", systemImage: "clock")
              .foregroundColor(.secondary)
            Text("145")
          }
        }
        Spacer()
      }
      .padding(.vertical)

      ChartView(workout: Workout.dummyWorkout())
        .frame(height: 200, alignment: .center)
        .background(LinearGradient(gradient: backgroundGradient, startPoint: .top, endPoint: .bottom))
    }
    .padding(.horizontal, 10)
  }

  private let backgroundGradient = Gradient(colors: [
    .purple.opacity(0.1),
    .blue.opacity(0.2),
  ])
}

struct ResultView_Previews: PreviewProvider {
  static var previews: some View {
    ResultView()
  }
}
