//
//  HomeView.swift
//  SwiftUI App for iOS 15
//
//  Created by Gonzalo Alfonso on 21/04/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
      ScrollView {
        FeaturedItem()
      }
      .overlay(
        NavigationBar(title: "Featured")
      )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
