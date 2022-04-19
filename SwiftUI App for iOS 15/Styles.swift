//
//  Styles.swift
//  SwiftUI App for iOS 15
//
//  Created by Gonzalo Alfonso on 13/04/2022.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
  var cornerRadius: CGFloat
  @Environment(\.colorScheme) var colorScheme
  func body(content: Content) -> some View {
    content.overlay(
      RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
        .stroke(
          .linearGradient(
            colors: [
              .white.opacity(colorScheme == .dark ? 0.3 : 0.6),
              .black.opacity(colorScheme == .dark ? 0.3 : 0.1)
            ], startPoint: .top, endPoint: .bottom)
        )
        .blendMode(.overlay)
    )
  }
}

extension View {
  func strokeStyle(cornerRadius: CGFloat = 30) -> some View {
    modifier(StrokeStyle(cornerRadius: cornerRadius))
  }
}
