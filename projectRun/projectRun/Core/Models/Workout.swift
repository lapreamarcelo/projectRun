//
//  Workout.swift
//  projectRun
//
//  Created by Libranner Leonel Santos Espinal on 5/11/21.
//

import Foundation

struct Workout: Identifiable {
  let id = UUID()
  let name: String
  let series: [Serie]

  var maxTime: Double {
    let serie = series.max { $0.time < $1.time }
    return serie?.time ?? 0
  }

  static func dummyWorkout() -> Workout {
    Workout(name: "Workout #1", series: [
      Serie(title: "Serie #1", time: 1),
      Serie(title: "Serie #2", time: 20),
      Serie(title: "Serie #3", time: 10),
      Serie(title: "Serie #4", time: 40),
      Serie(title: "Serie #5", time: 50),
      Serie(title: "Serie #6", time: 3),
    ])
  }

  static func dummyWorkouts() -> [Workout] {
    [Workout(name: "Workout #1", series: [
      Serie(title: "Serie #1", time: 1),
      Serie(title: "Serie #2", time: 20),
      Serie(title: "Serie #3", time: 10),
      Serie(title: "Serie #4", time: 40),
      Serie(title: "Serie #5", time: 50),
      Serie(title: "Serie #6", time: 3),
    ]),
     Workout(name: "Workout #2", series: [
       Serie(title: "Serie #1", time: 10),
       Serie(title: "Serie #2", time: 40),
       Serie(title: "Serie #3", time: 50),
       Serie(title: "Serie #4", time: 10),
       Serie(title: "Serie #5", time: 70),
       Serie(title: "Serie #6", time: 9),
     ])]
  }
}
