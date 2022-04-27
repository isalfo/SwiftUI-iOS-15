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
            AccountView()
          case .notifications:
            AccountView()
          case .library:
            AccountView()
          }
        
        TabBar()
          .offset(y: model.showDetail ? 200 : 0)
        
        if showModal {
          ZStack {
            Color.clear.background(.regularMaterial)
              .ignoresSafeArea()
            SignUpView()
            
            Button {
              withAnimation {
                showModal = false
              }
            } label: {
              Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.secondary)
                .padding(8)
              .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
          }
          .zIndex(1)
        }

      }
      .safeAreaInset(edge: .bottom) {
        Color.clear.frame(height: 44)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        ContentView()
        ContentView()
          .preferredColorScheme(.dark)
      }
      .environmentObject(Model())
    }
}
