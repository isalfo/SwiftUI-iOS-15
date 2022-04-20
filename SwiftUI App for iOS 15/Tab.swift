//
//  Tab.swift
//  SwiftUI App for iOS 15
//
//  Created by Gonzalo Alfonso on 20/04/2022.
//

import SwiftUI

struct TabItem: Identifiable {
  var id = UUID()
  var text: String
  var icon: String
}

var tabItems = [
  TabItem(text: "Learn Now", icon: "house"),
  TabItem(text: "Explore", icon: "magnifyingglass"),
  TabItem(text: "Notifications", icon: "bell"),
  TabItem(text: "Library", icon: "rectangle.stack")
]
