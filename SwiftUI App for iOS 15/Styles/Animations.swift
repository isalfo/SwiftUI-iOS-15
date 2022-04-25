//
//  Animations.swift
//  SwiftUI App for iOS 15
//
//  Created by Gonzalo Alfonso on 25/04/2022.
//

import SwiftUI

extension Animation {
  static let openCard = Animation.spring(response: 0.5, dampingFraction: 0.7)
  static let closeCard = Animation.spring(response: 0.6, dampingFraction: 0.9)
}
