//
//  Suggestion.swift
//  SwiftUI App for iOS 15
//
//  Created by Gonzalo Alfonso on 27/04/2022.
//

import SwiftUI

struct Suggestion: Identifiable {
  var id = UUID()
  var text: String
}

var suggestions: [Suggestion] = [
  Suggestion(text: "SwiftUI"),
  Suggestion(text: "React"),
  Suggestion(text: "Design")
]
