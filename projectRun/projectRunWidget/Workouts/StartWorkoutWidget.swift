//
//  StartWorkoutWidget.swift
//  projectRunWidgetExtension
//
//  Created by Misael Cuevas Vásquez on 6/11/21.
//

import SwiftUI
import WidgetKit

struct STEntry: TimelineEntry {
  var date: Date
}

struct STProvider: TimelineProvider {
  typealias Entry = STEntry

  func placeholder(in context: Context) -> STEntry {
    STEntry(date: Date())
  }

  func getSnapshot(in context: Context, completion: @escaping (STEntry) -> Void) {
    let entry = STEntry(date: Date())
    completion(entry)
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<STEntry>) -> Void) {
    let entries: [STEntry] = [STEntry(date: Date())]
    let timeline = Timeline(entries: entries, policy: .atEnd)
    completion(timeline)
  }
}

struct StartWorkoutWidget: Widget {
  private let kind: String = "StartWorkoutWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: STProvider()) { entry in
      WorkoutCardView()
    }
    .configurationDisplayName("Start Workout")
    .description("Quick access to start a workout")
    .supportedFamilies([.systemSmall])
  }
}
