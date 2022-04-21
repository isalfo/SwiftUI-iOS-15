//
//  PreferenceKeys.swift
//  SwiftUI App for iOS 15
//
//  Created by Gonzalo Alfonso on 21/04/2022.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
  static var defaultValue: CGFloat = 0
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value = nextValue()
  }
}
