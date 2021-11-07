//
//  Serie.swift
//  projectRun
//
//  Created by Libranner Leonel Santos Espinal on 5/11/21.
//

import Foundation
import SwiftUI

struct Serie: Identifiable {
  let id = UUID()
  let title: String
  let time: Double

  let distance: Double
  let measure: DistanceMeasure
  let rest: Int
  let pace: Pace
}

enum DistanceMeasure: String, Equatable, CaseIterable {
  case m = "m"
  case km = "km"

  var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

enum Pace: String, Equatable, CaseIterable {
  case twentyone = "21K"
  case ten = "10K"
  case five = "5K"
  case comfort = "Comfort"
  case celebration = "Celebration"

  var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}
