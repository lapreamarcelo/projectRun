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
      .padding()
      .overlay(
        RoundedRectangle(cornerRadius: 20)
          .stroke(.gray.opacity(0.3), lineWidth: 1)
          .shadow(color: .gray, radius: 2, x: 1, y: 1)
      )

      ChartView(workout: Workout.dummyWorkout())
        .background(LinearGradient(gradient: backgroundGradient, startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .overlay(
          RoundedRectangle(cornerRadius: 20)
            .stroke(.gray.opacity(0.3), lineWidth: 1)
            .shadow(color: .gray, radius: 2, x: 1, y: 1)
        )
      Spacer()
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
