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
                .font(.system(size: 14))
        }
    }
}

extension CircularCountdown {
    struct ProgressTrack: View {
        var color: Color = .red
        var strokeWidth: Double
        
        var body: some View {
            Circle()
                .fill(Color.clear)
                .overlay(
                    Circle()
                        .stroke(lineWidth: strokeWidth)
                        .opacity(0.3)
                        .foregroundColor(color)
                )
        }
    }


struct ProgressBar: View {
    var counter: Double
    var countTo: Double
    var color: Color = .red
    var strokeWidth: Double
    
    func progress() -> CGFloat {
        (CGFloat(counter) / CGFloat(countTo))
    }
    
    var body: some View {
        Circle()
            .fill(Color.clear)
            .overlay(
                Circle().trim(from:0, to: progress())
                    .stroke(
                        style: StrokeStyle(
                            lineWidth: strokeWidth,
                            lineCap: .round,
                            lineJoin:.round
                        )
                    )
                    .foregroundColor(color)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.easeInOut(duration: 0.2), value: 1)
            )
    }
}
}

struct CircularCountdown_Previews: PreviewProvider {
static var previews: some View {
    CircularCountdown(progress: .constant(0.1), total: 500)
        .frame(width: 75, height: 75, alignment: .center)
}
}
