//
//  ContentView.swift
//  SwiftUI App for iOS 15
//
//  Created by Gonzalo Alfonso on 12/04/2022.
//

import SwiftUI

struct ContentView: View {
  @AppStorage("selectedTab") var selectedTab: Tab = .home
  @AppStorage("showModal") var showModal: Bool = false
  @EnvironmentObject var model: Model
  
    var body: some View {
      ZStack(alignment: .bottom) {
        
          switch selectedTab {
          case .home:
            HomeView()
          case .explore:
            ExploreView()
          case .notifications:
            AccountView()
          case .library:
            AccountView()
          }
        
        TabBar()
          .offset(y: model.showDetail ? 200 : 0)
        
        if showModal {
          ModalView()
            .zIndex(1)
        }
      }
      .safeAreaInset(edge: .bottom) {
        Color.clear.frame(height: 44)
      }
      .dynamicTypeSize(.large ... .xxxLarge)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        ContentView()
          .environment(\.sizeCategory, .extraExtraLarge)
        ContentView()
          .preferredColorScheme(.dark)
      }
      .environmentObject(Model())
    }
}
