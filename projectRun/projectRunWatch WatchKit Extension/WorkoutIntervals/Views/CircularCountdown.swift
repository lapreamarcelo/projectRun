//
//  CircularCountdown.swift
//  projectRunWatch WatchKit Extension
//
//  Created by Marcelo Laprea on 6/11/21.
//

import SwiftUI

struct CircularCountdown: View {
  @Binding var progress: Double
  var total: Double = 0
  var color: Color = .red
  var strokeWidth: Double = 5

  var body: some View {
    ZStack {
      ProgressTrack(color: color, strokeWidth: strokeWidth)
      ProgressBar(counter: progress, countTo: total, color: color, strokeWidth: strokeWidth)
      Text(Measurement(value: progress, unit: UnitLength.meters).formatted(.measurement(width: .abbreviated, usage: .road)))
        .bold()
        .font(.system(size: 12))
    }
  }
}

struct CircularCountdown_Previews: PreviewProvider {
  static var previews: some View {
    CircularCountdown(progress: .constant(0.1), total: 500)
      .frame(width: 75, height: 75, alignment: .center)
  }
}
