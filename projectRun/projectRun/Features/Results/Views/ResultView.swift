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
          .font(.system(size: 60))
          .symbolVariant(.slash.fill)
          .foregroundStyle(.teal, .white)
          .symbolRenderingMode(.multicolor)

        VStack(alignment: .leading) {
          Text("Yesterday at 15:00")
            .font(.body)
            .foregroundColor(.secondary)
          Text("5.23 Kms")
            .font(.largeTitle)
            .foregroundColor(.primary)
        }
      }
      StatsSummaryView()
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
