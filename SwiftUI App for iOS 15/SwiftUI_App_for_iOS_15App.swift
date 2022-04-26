//
//  SwiftUI_App_for_iOS_15App.swift
//  SwiftUI App for iOS 15
//
//  Created by Gonzalo Alfonso on 12/04/2022.
//

import SwiftUI

@main
struct SwiftUI_App_for_iOS_15App: App {
  @StateObject var model = Model()
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(model)
        }
    }
}
