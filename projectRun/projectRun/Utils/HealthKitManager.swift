//
//  HealthKitManager.swift
//  projectRun
//
//  Created by Marcelo Laprea on 5/11/21.
//

import Foundation
import HealthKit

class HealthKitManager {
    func authorizeHealthKit(completion: @escaping (Bool, HealthKitError?) -> Void) {
        guard HKHealthStore.isHealthDataAvailable() else {
            completion(false, .notAvailableOnDevice)
            return
        }
        
        guard
            let heartRate = HKObjectType.quantityType(forIdentifier: .heartRate),
            let activeEnergy = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned),
            let runningDistance = HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)
        else {
            completion(false, .dataTypeNotAvailable)
            return
        }
        
        let typesToShare: Set = [HKQuantityType.workoutType()]
        let typesToRead: Set = [heartRate, activeEnergy, runningDistance, HKObjectType.activitySummaryType()]

        HKHealthStore().requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
            completion(success, .defaultError(error: error?.localizedDescription))
        }
    }
    
    
}

extension HealthKitManager {
    enum HealthKitError: Error {
        case notAvailableOnDevice
        case dataTypeNotAvailable
        case defaultError(error: String?)
    }
}

