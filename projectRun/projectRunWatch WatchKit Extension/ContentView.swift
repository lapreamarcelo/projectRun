//
//  ContentView.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Marcelo Laprea on 5/11/21.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    var healtKitManager = HealthKitManager()
    
    var health = HealthKitManagerWatch()
    var body: some View {
        MetricsView()
            .onAppear {
                healtKitManager.authorizeHealthKit { success, error in
                    print(error)
                    print(success)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
