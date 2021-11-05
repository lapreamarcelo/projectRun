//
//  HealthKitManagerWatch.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Marcelo Laprea on 5/11/21.
//

import Foundation
import HealthKit

class HealthKitManagerWatch: NSObject {
    func startWorkout() {
        let healthStore = HKHealthStore()
        let configuration = HKWorkoutConfiguration()
        configuration.activityType = .running
        configuration.locationType = .outdoor
        
        do {
            let session = try HKWorkoutSession(healthStore: healthStore, configuration: configuration)
            let builder = session.associatedWorkoutBuilder()
            builder.dataSource = HKLiveWorkoutDataSource(healthStore: healthStore,
                                                         workoutConfiguration: configuration)
            session.startActivity(with: Date())
            builder.delegate = self
            session.delegate = self
            builder.beginCollection(withStart: Date()) { (success, error) in
                guard success else {
                    return
                }
                
                print(success)
            }
        } catch {
            return
        }
    }
}


extension HealthKitManagerWatch: HKWorkoutSessionDelegate {
    func workoutSession(_ workoutSession: HKWorkoutSession, didChangeTo toState: HKWorkoutSessionState, from fromState: HKWorkoutSessionState, date: Date) {
        print("OK")
    }

    func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
        print("OK")
    }
}

extension HealthKitManagerWatch: HKLiveWorkoutBuilderDelegate {
    func workoutBuilder(_ workoutBuilder: HKLiveWorkoutBuilder, didCollectDataOf collectedTypes: Set<HKSampleType>) {
        for type in collectedTypes {
            guard let quantityType = type as? HKQuantityType else {
                return
            }
            
            let statistics = workoutBuilder.statistics(for: quantityType)
            print(statistics)
            print(quantityType)
            //let label = labelForQuantityType(quantityType)
            
            DispatchQueue.main.async() {
                // Update the user interface.
            }
        }

    }

    func workoutBuilderDidCollectEvent(_ workoutBuilder: HKLiveWorkoutBuilder) {
        let lastEvent = workoutBuilder.workoutEvents.last
        print(lastEvent)
            
            DispatchQueue.main.async() {
                // Update the user interface here.
            }
    }
}
