//
//  ChartView.swift
//  projectRun
//
//  Created by Libranner Leonel Santos Espinal on 5/11/21.
//

import SwiftUI

struct ChartView: View {
  let workout: Workout

  var body: some View {
    var position = 0

    TimelineView(.animation(minimumInterval: 0.16)) { timeContext in
      Canvas { context, size in
        let height = size.height
        let offset = size.width / Double(workout.series.count - 1)
        let maxPoint = workout.maxTime

        if position >= workout.series.count {
          position = workout.series.count
        }
        else {
          position += 1
        }

        var space = 0.0
        let points = workout.series[0..<position].map { serie -> CGPoint in
          let progress = serie.time / maxPoint
          let pathHeight = progress * height

          let pathWidth = offset * space
          space += 1

          return CGPoint(x: pathWidth, y: pathHeight)
        }

        context.fill(makePath(points: points),
                     with: .color(.green))
      }
    }
  }

  private func makePath(points: [CGPoint]) -> Path {
    Path { path in
      path.move(to: CGPoint(x: 0, y: 0))
      path.addLines(points)
    }
    .strokedPath(StrokeStyle(lineWidth: 3.0, lineCap: .round, lineJoin: .round))
  }
}

struct ChartView_Previews: PreviewProvider {
  static var previews: some View {
    ChartView(workout: Workout.dummyWorkout())
  }
}
