//
//  ResultView.swift
//  projectRun
//
//  Created by Libranner Leonel Santos Espinal on 5/11/21.
//

import SwiftUI

struct ResultView: View {
  var body: some View {
    ChartView(workout: Workout.dummyWorkout())
      .frame(height: 200, alignment: .center)
      .padding(.horizontal, 5)
      .background(LinearGradient(gradient: backgroundGradient, startPoint: .top, endPoint: .bottom))
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
