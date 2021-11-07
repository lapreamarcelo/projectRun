//
//  WorkoutsView.swift
//  projectRun
//
//  Created by Misael Cuevas Vásquez on 5/11/21.
//

import SwiftUI

// MARK: - WorkoutView
struct WorkoutsView: View {
    @EnvironmentObject private var syncViewModel: SyncViewModel
    @StateObject private var viewModel = WorkoutListViewModel()

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.workouts) { workout in
                        WorkoutCardView(workout: workout)
                    }
                }
                Spacer()
            }
            .navigationBarTitle(Text("Workouts"))
            .toolbar {
                ToolbarItemGroup {
                    HStack {
                        Button {
                            syncViewModel.session.sendMessage(["workouts" : viewModel.workouts], replyHandler: nil) { (error) in
                                print(error.localizedDescription)
                            }
                        } label: {
                            Label("Sync", systemImage: "arrow.triangle.2.circlepath")
                        }
                        .disabled(!syncViewModel.session.isReachable)

                        NavigationLink(destination: WorkoutFormView(viewModel: self.viewModel)) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            }
        }
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
            .environmentObject(SyncViewModel())
    }
}
