//
//  WorkoutIntervalsView.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Marcelo Laprea on 6/11/21.
//

import SwiftUI

struct WorkoutIntervalsView: View {
    @ObservedObject var viewModel: WorkoutIntervalsViewModel
    
    private struct MetricsTimelineSchedule: TimelineSchedule {
        var startDate: Date
        
        init(from startDate: Date) {
            self.startDate = startDate
        }
        
        func entries(from startDate: Date, mode: TimelineScheduleMode) -> PeriodicTimelineSchedule.Entries {
            PeriodicTimelineSchedule(from: self.startDate, by: (mode == .lowFrequency ? 1.0 : 1.0 / 30.0))
                .entries(from: startDate, mode: mode)
        }
    }
    
    var body: some View {
        TimelineView(MetricsTimelineSchedule(from: viewModel.workoutManager.builder?.startDate ?? Date())) { context in
            GeometryReader { reader in
                VStack(alignment: .leading) {
                    HStack(spacing: 12) {
                        CircularCountdown(progress: $viewModel.workoutManager.distance, total: 100, color: .green, strokeWidth: 5)
                            .padding()
                            .frame(width: reader.size.width * 0.4)
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(spacing: 2) {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.red)
                                Text(viewModel.workoutManager.heartRate.formatted(.number.precision(.fractionLength(0))) + " BPM")
                                    .font(.system(size: 14))
                            }
                            HStack(spacing: 5) {
                                Image(systemName: "clock.fill")
                                    .foregroundColor(.white)
                                ElapsedTimeView(elapsedTime: viewModel.workoutManager.builder?.elapsedTime ?? 0, showSubseconds: context.cadence == .live)
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .frame(height: reader.size.height / 2)
                    .padding(.top, 13)
                    VStack {
                        Text(viewModel.pace + "'' Km")
                            .foregroundColor(.yellow)
                            .bold()
                            .font(.system(size: 22))
                        Spacer()
                        Text(Measurement(value: 100, unit: UnitLength.meters).formatted(.measurement(width: .abbreviated, usage: .road)))
                            .bold()
                            .font(.system(size: 18))
                        Text("1 of 20")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
    
                    }
                    .frame(width: reader.size.width)
                    .padding(.bottom, 13)
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct WorkoutIntervalsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutIntervalsView(viewModel: WorkoutIntervalsViewModel(workoutManger: WorkoutManager()))
    }
}

