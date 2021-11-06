//
//  WorkoutRepository.swift
//  projectRun
//
//  Created by Libranner Leonel Santos Espinal on 6/11/21.
//

import Combine

struct WorkoutRepository {
  private var workouts = [Workout]()

  init() {
    workouts.append(contentsOf: Workout.dummyWorkouts())
  }

  func getAll() -> AnyPublisher<[Workout], Never> {
    Just(workouts)
      .eraseToAnyPublisher()
  }
}
