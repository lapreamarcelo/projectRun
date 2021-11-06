//
//  WorkoutsView.swift
//  projectRun
//
//  Created by Misael Cuevas Vásquez on 5/11/21.
//

import SwiftUI

// MARK: - WorkoutView
struct WorkoutsView: View {
  @State private var showingSheet = false

  var body: some View {
    NavigationView {
      VStack {
        WorkoutCardView()
      }
      .navigationBarTitle(Text("Workouts"))
      .toolbar {
        ToolbarItem {
          Button {
            showingSheet.toggle()
          } label: {
            Label("Add Item", systemImage: "plus")
          }
        }
      }
      .sheet(isPresented: $showingSheet) {
        WorkoutFormView()
      }
    }
  }
}

struct WorkoutsView_Previews: PreviewProvider {
  static var previews: some View {
    WorkoutsView()
  }
}
