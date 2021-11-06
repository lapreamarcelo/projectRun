//
//  StatsSummaryView.swift
//  projectRun
//
//  Created by Libranner Leonel Santos Espinal on 6/11/21.
//

import SwiftUI

struct StatsSummaryView: View {
  var body: some View {
    HStack {
      VStack(spacing: 20) {
        VStack {
          Label("Avg. Heart Rate", systemImage: "heart")
            .foregroundColor(.secondary)
          Text("145")
            .foregroundColor(.primary)
        }

        VStack {
          Label("Avg. Pace", systemImage: "figure.walk")
            .foregroundColor(.secondary)
          Text("145")
            .foregroundColor(.primary)
        }
      }
      Spacer()
      VStack(spacing: 20) {
        VStack {
          Label("Calories", systemImage: "flame")
            .foregroundColor(.secondary)
          Text("145")
            .foregroundColor(.primary)
        }
        VStack {
          Label("Time", systemImage: "clock")
            .foregroundColor(.secondary)
          Text("145")
            .foregroundColor(.primary)
        }
      }
      .font(.caption)
      Spacer()
    }
  }
}

struct StatsSummaryView_Previews: PreviewProvider {
  static var previews: some View {
    StatsSummaryView()
  }
}
