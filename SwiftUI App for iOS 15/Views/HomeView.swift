//
//  HomeView.swift
//  SwiftUI App for iOS 15
//
//  Created by Gonzalo Alfonso on 21/04/2022.
//

import SwiftUI

struct HomeView: View {
  @State var hasScrolled: Bool = false
    var body: some View {
      ScrollView {
        GeometryReader { proxy in
          Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        FeaturedItem()
        Color.clear.frame(height: 1000)
      }
      .coordinateSpace(name: "scroll")
      .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
        withAnimation(.easeInOut) {
          if value < 0 {
            hasScrolled = true
          } else {
            hasScrolled = false
          }
        }
        
      })
      .safeAreaInset(edge: .top, content: {
        Color.clear.frame(height: 70)
      })
      .overlay(
        NavigationBar(title: "Featured")
          .opacity(hasScrolled ? 1 : 0)
      )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
