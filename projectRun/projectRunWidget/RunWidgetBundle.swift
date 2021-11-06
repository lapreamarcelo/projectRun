//
//  RunWidgetBundle.swift
//  projectRunWidgetExtension
//
//  Created by Misael Cuevas Vásquez on 6/11/21.
//

import SwiftUI
import WidgetKit

@main
struct RunWidgetBundle: WidgetBundle {
  @WidgetBundleBuilder
  var body: some Widget {
    StartWorkoutWidget()
    LastRunWidget()
    ResultsWidget()
  }
}
