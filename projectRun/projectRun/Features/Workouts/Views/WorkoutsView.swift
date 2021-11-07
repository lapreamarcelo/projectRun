//
//  WorkoutsView.swift
//  projectRun
//
//  Created by Misael Cuevas Vásquez on 5/11/21.
//

import SwiftUI

// MARK: - WorkoutView
struct WorkoutsView: View {
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
            WorkoutCardView()
          }
        }
        Spacer()
      }
      .navigationBarTitle(Text("Workouts"))
      .toolbar {
        ToolbarItem {
          NavigationLink(destination: WorkoutFormView(viewModel: self.viewModel)) {
            Label("Add Item", systemImage: "plus")
          }
        }
      }
    }
  }
}

struct WorkoutsView_Previews: PreviewProvider {
  static var previews: some View {
    WorkoutsView()
  }
}
