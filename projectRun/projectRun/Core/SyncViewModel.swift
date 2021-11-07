//
//  SyncViewModel.swift
//  projectRun
//
//  Created by Sebastian Fernandez on 07/11/2021.
//

import Foundation
import WatchConnectivity

class SyncViewModel : NSObject,  WCSessionDelegate, ObservableObject {
    var session: WCSession

    init(session: WCSession = .default){
        self.session = session
        session.activate()
    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {

    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        guard let workouts =  message["workouts"] as? [Workout] else { return }

        workouts.forEach { workout in
            WorkoutRepository.shared.add(workout)
        }
    }
    
    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {

    }

    func sessionDidDeactivate(_ session: WCSession) {

    }
    #endif
}
