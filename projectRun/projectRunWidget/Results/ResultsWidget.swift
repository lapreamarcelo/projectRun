//
//  ResultsWidget.swift
//  projectRunWidgetExtension
//
//  Created by Misael Cuevas Vásquez on 6/11/21.
//

import SwiftUI
import WidgetKit

struct ResultsEntry: TimelineEntry {
  var date: Date
}

struct ResultsProvider: TimelineProvider {
  typealias Entry = ResultsEntry

  func placeholder(in context: Context) -> ResultsEntry {
    ResultsEntry(date: Date())
  }

  func getSnapshot(in context: Context, completion: @escaping (ResultsEntry) -> Void) {
    let entry = ResultsEntry(date: Date())
    completion(entry)
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<ResultsEntry>) -> Void) {
    let entries: [ResultsEntry] = [ResultsEntry(date: Date())]
    let timeline = Timeline(entries: entries, policy: .atEnd)
    completion(timeline)
  }
}

struct ResultsWidget: Widget {
  private let kind: String = "ResultsWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: ResultsProvider()) { entry in
      VStack {
        StatsSummaryHeaderView()
        StatsSummaryView()
          .padding()
      }
    }
    .configurationDisplayName("Last results")
    .description("Check your last results")
    .supportedFamilies([.systemLarge])
  }
}
