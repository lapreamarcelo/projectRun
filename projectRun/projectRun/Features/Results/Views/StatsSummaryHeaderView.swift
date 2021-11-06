//
//  StatsSummaryHeaderView.swift
//  projectRun
//
//  Created by Misael Cuevas Vásquez on 6/11/21.
//

import SwiftUI
import WidgetKit

struct StatsSummaryHeaderView: View {
  var body: some View {
    HStack {
      Image(systemName: "figure.walk.circle")
        .font(.system(size: 60))
        .symbolVariant(.slash.fill)
        .foregroundStyle(.teal, .white)
        .symbolRenderingMode(.multicolor)
      
      VStack(alignment: .leading) {
        Text("Yesterday at 15:00")
          .font(.body)
          .foregroundColor(.secondary)
        Text("5.23 Kms")
          .font(.largeTitle)
          .foregroundColor(.primary)
      }
    }
  }
}

struct StatsSummaryHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      StatsSummaryHeaderView()
        .previewLayout(.sizeThatFits)

      StatsSummaryHeaderView()
        .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
  }
}
