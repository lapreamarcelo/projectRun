//
//  ActivityHeader.swift
//  projectRun
//
//  Created by Libranner Leonel Santos Espinal on 6/11/21.
//

import SwiftUI

struct ActivityHeader: View {
  let date: Date
  let distance: Double

  var body: some View {
    HStack {
      Image(systemName: "clock.arrow.circlepath")
        .font(.body)
        .foregroundColor(.secondary)
      Text(date, style: .date)
        .font(.caption)
        .foregroundColor(.secondary)
      Text(String(format: "%.2f m", distance))
        .font(.body)
        .bold()
        .foregroundColor(.primary)
    }
  }
}

struct ActivityHeader_Previews: PreviewProvider {
  static var previews: some View {
    ActivityHeader(date: Date.now, distance: 100)
  }
}
