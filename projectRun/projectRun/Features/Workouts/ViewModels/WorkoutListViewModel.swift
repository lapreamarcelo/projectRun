//
//  WorkoutListViewModel.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Libranner Leonel Santos Espinal on 6/11/21.
//

import Foundation
import Combine
import MapKit

class WorkoutListViewModel: ObservableObject {
  @Published var workouts = [Workout]()
  private let repository = WorkoutRepository()
  private var cancellables = Set<AnyCancellable>()

  init() {
    get()
  }

  func get() {
    repository.getAll()
      .sink { workouts in
        self.workouts = workouts
      }
      .store(in: &cancellables)
  }

  func add(_ workout: Workout) {
    repository.add(workout)
    get()
  }
}
