//
//  Model.swift
//  SwiftUI App for iOS 15
//
//  Created by Gonzalo Alfonso on 26/04/2022.
//

import SwiftUI
import Combine

class Model: ObservableObject {
  @Published var showDetail: Bool = false
  @Published var selectedModal: Modal = .signUp
}

enum Modal: String {
  case signUp
  case signIn
}
