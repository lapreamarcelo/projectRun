//
//  WorkoutIntervalsView.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Marcelo Laprea on 6/11/21.
//

import SwiftUI

struct WorkoutIntervalsView: View {
    @ObservedObject var viewModel: WorkoutIntervalsViewModel
    
    var body: some View {
        VStack {
            GeometryReader {   reader in
                HStack(spacing: 12) {
                    CircularCountdown(progress: $viewModel.workoutManager.distance, total: 100, color: .green, strokeWidth: 6)
                        .padding()
                        .frame(width: reader.size.width / 2.5)
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 2) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                            Text(viewModel.workoutManager.heartRate.formatted(.number.precision(.fractionLength(0))) + "BPM")
                                .font(.system(size: 14))
                        }
                        HStack(spacing: 7) {
                            Image(systemName: "figure.walk")
                                .foregroundColor(.white)
                            Text("5:30" + " ''/Km")
                                .font(.system(size: 14))
                        }
                    }
                }
            }
        }
    }
}

struct WorkoutIntervalsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutIntervalsView(viewModel: WorkoutIntervalsViewModel(workoutManger: WorkoutManager()))
    }
}

