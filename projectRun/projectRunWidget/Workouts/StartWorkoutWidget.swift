//
//  StartWorkoutWidget.swift
//  projectRunWidgetExtension
//
//  Created by Misael Cuevas Vásquez on 6/11/21.
//

import SwiftUI
import WidgetKit

let mockWorkout: Workout = Workout(name: "Workout 1", series: [
  Serie(title: "", time: 0, distance: 12, measure: .km, rest: 0, pace: .comfort)
])

struct STEntry: TimelineEntry {
  var date: Date
  var workout: Workout
}

struct STProvider: TimelineProvider {
  typealias Entry = STEntry

  func placeholder(in context: Context) -> STEntry {
    STEntry(date: Date(), workout: mockWorkout)
  }

  func getSnapshot(in context: Context, completion: @escaping (STEntry) -> Void) {
    let entry = STEntry(date: Date(), workout: mockWorkout)
    completion(entry)
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<STEntry>) -> Void) {
    let entries: [STEntry] = [STEntry(date: Date(), workout: mockWorkout)]
    let timeline = Timeline(entries: entries, policy: .atEnd)
    completion(timeline)
  }
}

struct StartWorkoutWidget: Widget {
  private let kind: String = "StartWorkoutWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: STProvider()) { entry in
      WorkoutCardView(workout: entry.workout)
    }
    .configurationDisplayName("Start Workout")
    .description("Quick access to start a workout")
    .supportedFamilies([.systemSmall])
  }
}
