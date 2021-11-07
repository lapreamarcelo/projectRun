//
//  WorkoutRepository.swift
//  projectRun
//
//  Created by Libranner Leonel Santos Espinal on 6/11/21.
//

import Combine

class WorkoutRepository {
    static let shared = WorkoutRepository()
    private var workouts = [Workout]()

    private init() {
        workouts.append(contentsOf: Workout.dummyWorkouts())
    }

    func getAll() -> AnyPublisher<[Workout], Never> {
        Just(workouts)
            .eraseToAnyPublisher()
    }

    func add(_ workout: Workout) {
        workouts.append(workout)
    }

    func remove(_ workout: Workout) {
        workouts.removeAll {
            $0.id == workout.id
        }
    }

    func update(_ workout: Workout) {
        remove(workout)
        add(workout)
    }
}
