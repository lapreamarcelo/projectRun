//
//  ProgressBar.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Libranner Leonel Santos Espinal on 7/11/21.
//

import SwiftUI

struct ProgressTrack: View {
  var color: Color = .red
  var strokeWidth: Double

  var body: some View {
    Circle()
      .fill(Color.clear)
      .overlay(
        Circle()
          .stroke(lineWidth: strokeWidth)
          .opacity(0.3)
          .foregroundColor(color)
      )
  }
}


struct ProgressBar: View {
  var counter: Double
  var countTo: Double
  var color: Color = .red
  var strokeWidth: Double

  func progress() -> CGFloat {
    (CGFloat(counter) / CGFloat(countTo))
  }

  var body: some View {
    Circle()
      .fill(Color.clear)
      .overlay(
        Circle().trim(from:0, to: progress())
          .stroke(
            style: StrokeStyle(
              lineWidth: strokeWidth,
              lineCap: .round,
              lineJoin:.round
            )
          )
          .foregroundColor(color)
          .rotationEffect(Angle(degrees: 270.0))
          .animation(.easeInOut(duration: 0.2), value: 1)
      )
  }
}
