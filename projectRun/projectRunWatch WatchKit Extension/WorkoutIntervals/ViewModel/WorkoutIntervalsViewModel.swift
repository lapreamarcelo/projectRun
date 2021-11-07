//
//  WorkoutIntervalsViewModel.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Marcelo Laprea on 6/11/21.
//

import Combine
import HealthKit
import SwiftUI

class CurrentInterval {
    let startDistance: Double
    var finalDistance: Double
    let goalDistance: Double
    
    init(startDistance: Double, finalDistance: Double, goalDistance: Double) {
        self.startDistance = startDistance
        self.finalDistance = finalDistance
        self.goalDistance = goalDistance
    }
    
    func distanceCovered(totalDistance: Double) -> Double {
        totalDistance - startDistance
    }
    
    func check(totalDistance: Double) -> Bool {
        if distanceCovered(totalDistance: totalDistance) >= goalDistance {
            finalDistance = totalDistance
            return true
        } else {
            return false
        }
    }
}

class WorkoutIntervalsViewModel: ObservableObject {
    @Published var workoutManager: WorkoutManager
    @Published var workout: Workout
    @Published var shouldStartRest: Bool = false
    @Published var pace: String = "00:00"
    @Published var distance: Double = 0
    
    private var currentSeconds: Int = 0
    private var currentRestSeconds: Int = 0
    private var currentIntervals: [CurrentInterval] = []
    private var lastRestDistance: Double = 0
    
    private var startedAt = Date()
    private var total: Double = 20
    private var timer = Timer.publish(every: 1, on: .main, in: .default)
    private var restTimer = Timer.publish(every: 1, on: .main, in: .default)
    
    private var subscriptions: Set<AnyCancellable> = []
    
    init(workoutManger: WorkoutManager, workout: Workout) {
        self.workoutManager = workoutManger
        self.workout = workout
        
        print("SUPER FLAG")
        print(workout)
        self.currentIntervals.append(CurrentInterval(startDistance: 0,
                                                     finalDistance: 0,
                                                     goalDistance: 20))
        setup()
    }
}

private extension WorkoutIntervalsViewModel {
    func setup() {
        workoutManager
            .$distance
            .sink { [weak self] distance in
                self?.checkDistante(distance: distance)
                self?.calculatePace(distance: distance)
            }
            .store(in: &subscriptions)
        
        startTimer()
    }
    
    func checkDistante(distance: Double) {
        if shouldStartRest {
            return
        }
        
        guard let current = currentIntervals.last, current.finalDistance == 0 else { return }
        
        self.distance = distance - current.startDistance

        if current.check(totalDistance: distance) {
            startRest()
        }
    }
    
    func startTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .default)
        timer
            .autoconnect()
            .sink { _ in
                print("TIMER \(self.currentSeconds)")
                self.currentSeconds += 1
            }
            .store(in: &subscriptions)
    }
    
    func startRest() {
        timer.connect().cancel()
        shouldStartRest = true
        restTimer = Timer.publish(every: 1, on: .main, in: .default)
        
        restTimer
            .autoconnect()
            .sink { _ in
                print("REST TIMER \(self.currentRestSeconds)")
                self.currentRestSeconds += 1
                if self.currentRestSeconds >= 7 {
                    self.stopRest()
                }
            }
            .store(in: &subscriptions)
    }
    
    func stopRest() {
        currentIntervals.append(CurrentInterval(startDistance: workoutManager.distance, finalDistance: 0, goalDistance: 20))
        shouldStartRest = false
        currentRestSeconds = 0
        currentSeconds = 0
        distance = 0
        restTimer.connect().cancel()
        startTimer()
    }
    
    func calculatePace(distance: Double) {
        if currentSeconds == 0 {
            return
        }
        
        var currentDistance = distance
        if let lastInterval = currentIntervals.last {
            currentDistance = distance - lastInterval.startDistance
        }
        
        let currentPace = (1000 * Double(currentSeconds)) / currentDistance
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        
        guard let formattedPace = formatter.string(from: TimeInterval(currentPace)) else { return }
    
        self.pace = formattedPace
    }
}
