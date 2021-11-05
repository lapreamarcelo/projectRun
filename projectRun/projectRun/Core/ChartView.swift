//
//  ChartView.swift
//  projectRun
//
//  Created by Libranner Leonel Santos Espinal on 5/11/21.
//

import SwiftUI

struct Serie {
  let title: String
  let time: Double
}

struct Workout {
  let series: [Serie]

  var maxTime: Double {
    let serie = series.max { $0.time < $1.time }
    return serie?.time ?? 0
  }
}

let gradient = Gradient(colors: [
  Color(red: 0, green: 0, blue: 129.0/255.0),
  .blue,
  Color(red: 30.0/255.0, green: 104.0/255.0, blue: 1.0),
  Color(red: 0, green: 181/255.0, blue: 1.0),
  Color(red: 135.0/255.0, green: 206.0/255.0, blue: 250.0/255.0),
  .green,
  .yellow,
  .orange,
  Color(red: 1.0, green: 110.0/255.0, blue: 0.0),
  .red,
  Color(red: 139.0/255.0, green: 0.0, blue: 0.0)
])

let backgroundGradient = Gradient(colors: [
  .purple.opacity(0.1),
  Color(red: 0, green: 0, blue: 129.0/255.0),
  .blue.opacity(0.3),
  Color(red: 30.0/255.0, green: 104.0/255.0, blue: 1.0).opacity(0.1),
  Color(red: 0, green: 181/255.0, blue: 1.0).opacity(0.1),
  Color(red: 135.0/255.0, green: 206.0/255.0, blue: 250.0/255.0).opacity(0.3),
  .green.opacity(0.3),
  .yellow.opacity(0.3),
  .orange.opacity(0.3),
  Color(red: 1.0, green: 110.0/255.0, blue: 0.0).opacity(0.3),
  .red.opacity(0.3),
  Color(red: 139.0/255.0, green: 0.0, blue: 0.0).opacity(0.3)
])

struct ChartView: View {
  let workout: Workout

  func makePath(points: [CGPoint]) -> Path {
    Path { path in
      path.move(to: CGPoint(x: 0, y: 0))
      path.addLines(points)
    }
    .strokedPath(StrokeStyle(lineWidth: 3.0, lineCap: .round, lineJoin: .round))
  }

  var body: some View {
    let startDate = Date.now
    var position = 0

    TimelineView(.periodic(from: .now, by: 0.25)) { timeContext in
      Canvas { context, size in
        let height = size.height
        let offset = size.width / Double(workout.series.count - 1)
        let maxPoint = workout.maxTime

        var space = 0.0
        if position >= workout.series.count {
          position = workout.series.count
        }
        else {
          position += 1
        }

        let data = workout.series[0..<position]
        let points = data.map { serie -> CGPoint in
          let progress = serie.time / maxPoint
          let pathHeight = progress * height

          let pathWidth = offset * space
          space += 1

          return CGPoint(x: pathWidth, y: pathHeight)
        }

        context.stroke(makePath(points: points),
                       with: .linearGradient(gradient,
                                             startPoint: .init(x: 0.0, y: 1.0),
                                             endPoint: .init(x: 0.0, y: 0.0)
                                            ))

        context.clip(to: makePath(points: points))
        context.fill(makePath(points: points),
                     with: .color(.green))

        
//        LinearGradient(gradient: backgroundGradient, startPoint: .top, endPoint: .bottom)
//          .clipShape(Path { path in
//            path.move(to: CGPoint(x: 0, y: 0))
//            path.addLines(points)
//
//            path.addLine(to: CGPoint(x: width, y: height))
//            path.addLine(to: CGPoint(x: 0, y: height))
//          })

        //Drawing
        //        Path { path in
        //          path.move(to: CGPoint(x: 0, y: 0))
        //          path.addLines(points)
        //        }
        //        .strokedPath(StrokeStyle(lineWidth: 3.0, lineCap: .round, lineJoin: .round))
        //        .fill(
        //          LinearGradient(
        //            gradient: gradient,
        //            startPoint: .init(x: 0.0, y: 1.0),
        //            endPoint: .init(x: 0.0, y: 0.0))
        //        )
        //
        //        LinearGradient(gradient: backgroundGradient, startPoint: .top, endPoint: .bottom)
        //          .clipShape(Path { path in
        //            path.move(to: CGPoint(x: 0, y: 0))
        //            path.addLines(points)
        //
        //            path.addLine(to: CGPoint(x: width, y: height))
        //            path.addLine(to: CGPoint(x: 0, y: height))
        //          })
      }
    }
  }
}

struct ChartView_Previews: PreviewProvider {
  static var previews: some View {
    let workout = Workout(series: [
      Serie(title: "Serie #1", time: 1),
      Serie(title: "Serie #2", time: 20),
      Serie(title: "Serie #3", time: 10),
      Serie(title: "Serie #4", time: 40),
      Serie(title: "Serie #5", time: 50),
      Serie(title: "Serie #6", time: 3),
    ])
    ChartView(workout: workout)
  }
}
