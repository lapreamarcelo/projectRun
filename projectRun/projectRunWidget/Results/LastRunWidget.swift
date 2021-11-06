//
//  LastRunWidget.swift
//  projectRunWidgetExtension
//
//  Created by Misael Cuevas Vásquez on 6/11/21.
//

import SwiftUI
import WidgetKit

struct LREntry: TimelineEntry {
  var date: Date
}

struct LRProvider: TimelineProvider {
  typealias Entry = LREntry

  func placeholder(in context: Context) -> LREntry {
    LREntry(date: Date())
  }

  func getSnapshot(in context: Context, completion: @escaping (LREntry) -> Void) {
    let entry = LREntry(date: Date())
    completion(entry)
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<LREntry>) -> Void) {
    let entries: [LREntry] = [LREntry(date: Date())]
    let timeline = Timeline(entries: entries, policy: .atEnd)
    completion(timeline)
  }
}

struct LastRunWidget: Widget {
  private let kind: String = "LastRunWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: LRProvider()) { entry in
      StatsSummaryHeaderView()
    }
    .configurationDisplayName("Last Run Results")
    .description("View your last run results")
    .supportedFamilies([.systemSmall])
  }
}
