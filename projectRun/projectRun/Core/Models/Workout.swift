//
//  Workout.swift
//  projectRun
//
//  Created by Libranner Leonel Santos Espinal on 5/11/21.
//

import Foundation

struct Workout {
  let series: [Serie]

  var maxTime: Double {
    let serie = series.max { $0.time < $1.time }
    return serie?.time ?? 0
  }

  static func dummyWorkout() -> Workout {
    Workout(series: [
      Serie(title: "Serie #1", time: 1),
      Serie(title: "Serie #2", time: 20),
      Serie(title: "Serie #3", time: 10),
      Serie(title: "Serie #4", time: 40),
      Serie(title: "Serie #5", time: 50),
      Serie(title: "Serie #6", time: 3),
    ])
  }
}
