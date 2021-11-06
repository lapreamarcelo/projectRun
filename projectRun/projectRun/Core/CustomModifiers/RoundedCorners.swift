//
//  RoundedCorners.swift
//  projectRun
//
//  Created by Libranner Leonel Santos Espinal on 5/11/21.
//

import SwiftUI

struct RoundedCorners: ViewModifier {
  let radius: Double

  func body(content: Content) -> some View {
    content
      .cornerRadius(radius)
      .overlay(
        RoundedRectangle(cornerRadius: radius)
          .stroke(.gray.opacity(0.3), lineWidth: 1)
          .shadow(color: .gray, radius: 2, x: 1, y: 1)
      )
  }
}

extension View {
  func roundCorners(radius: Double) -> some View {
    modifier(RoundedCorners(radius: radius))
  }
}
