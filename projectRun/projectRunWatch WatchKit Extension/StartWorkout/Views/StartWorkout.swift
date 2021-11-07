//
//  StartWorkout.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Sebastian Fernandez on 06/11/2021.
//

import SwiftUI

struct StartWorkout: View {
    @State var counting: Bool = false
    @StateObject var workoutManager = WorkoutManager()
    var workout: Workout

    @ObservedObject var countdownViewModel = CountdownViewModel(seconds: 3)

    var body: some View {

        if !counting {
            Button {
                withAnimation(.easeOut) {
                    counting = true
                }

            } label: {
                Text("Start")
                    .foregroundColor(.black)
                    .bold()
                    .italic()
                    .font(.system(size: 35))
                    .padding(30)
            }
            .background(.orange)
            .clipShape(Circle())
        } else if countdownViewModel.finished {
            WorkoutOngoingView(workoutManager: workoutManager, workout: workout)
                .animation(.default.delay(2), value: countdownViewModel.finished)
                .transition(.opacity)
                .onAppear {
                    workoutManager.authorizeHealthKit()
                }
        } else {
            CountdownView(viewModel: countdownViewModel)
                .transition(.opacity)
        }
    }
}

struct StartWorkout_Previews: PreviewProvider {
    static var previews: some View {
        StartWorkout(workout: Workout(name: "", series: []))
    }
}
