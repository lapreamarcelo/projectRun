//
//  ResultView.swift
//  projectRun
//
//  Created by Libranner Leonel Santos Espinal on 5/11/21.
//

import SwiftUI

struct ResultView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      HStack {
        Image(systemName: "figure.walk.circle")
          .font(.largeTitle)

        VStack(alignment: .leading) {
          Text("Yesterday at 15:00")
            .font(.body)
            .foregroundColor(.secondary)
          Text("5.23 Kms")
            .font(.largeTitle)
            .foregroundColor(.primary)
        }
      }
      HStack {
        VStack(spacing: 20) {
          VStack {
            Label("Avg. Heart Rate", systemImage: "heart")
              .foregroundColor(.secondary)
            Text("145")
              .foregroundColor(.primary)
          }

          VStack {
            Label("Avg. Pace", systemImage: "figure.walk")
              .foregroundColor(.secondary)
            Text("145")
              .foregroundColor(.primary)
          }
        }
        Spacer()
        VStack(spacing: 20) {
          VStack {
            Label("Calories", systemImage: "flame")
              .foregroundColor(.secondary)
            Text("145")
              .foregroundColor(.primary)
          }
          VStack {
            Label("Time", systemImage: "clock")
              .foregroundColor(.secondary)
            Text("145")
              .foregroundColor(.primary)
          }
        }
        .font(.body)
        Spacer()
      }
      .padding()
      .roundCorners(radius: 20)

      ChartView(workout: Workout.dummyWorkout())
        .background(LinearGradient(gradient: backgroundGradient, startPoint: .top, endPoint: .bottom))
        .roundCorners(radius: 20)

      ResultMapView()
        .roundCorners(radius: 20)
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
    NavigationView {
      ResultView()
    }
  }
}
