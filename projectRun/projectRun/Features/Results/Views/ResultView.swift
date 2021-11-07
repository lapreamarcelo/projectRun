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
      StatsSummaryHeaderView()
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
