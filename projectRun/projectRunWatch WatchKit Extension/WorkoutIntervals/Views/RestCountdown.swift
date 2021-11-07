//
//  RestCountdown.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Libranner Leonel Santos Espinal on 7/11/21.
//

import SwiftUI

struct RestCountdown: View {
  @Binding var progress: Double
  var total: Double = 0
  var color: Color = .red
  var strokeWidth: Double = 5

  var body: some View {
    ZStack {
      ProgressTrack(color: color, strokeWidth: strokeWidth)
      ProgressBar(counter: progress, countTo: total, color: color, strokeWidth: strokeWidth)
    }
  }
}
