//
//  AccountView.swift
//  SwiftUI App for iOS 15
//
//  Created by Gonzalo Alfonso on 19/04/2022.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
      NavigationView {
        List {
          VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.badge.checkmark")
              .symbolVariant(.circle.fill)
              .font(.system(size: 32))
              .symbolRenderingMode(.palette)
              .foregroundStyle(.blue, .blue.opacity(0.3))
              .padding()
              .background(Circle().fill(.ultraThinMaterial))
              .background(
                Image(systemName: "hexagon")
                  .symbolVariant(.fill)
                  .foregroundColor(.blue)
                  .font(.system(size: 200))
                  .offset(x: -50, y: -100)
            )
            Text("Gonzalo Alfonso")
              .font(.title.weight(.semibold))
            HStack {
              Image(systemName: "location")
                .imageScale(.large)
              Text("Argentina")
                .foregroundColor(.secondary)
            }
          }
          .frame(maxWidth: .infinity)
          .padding()
            
          Section {
            NavigationLink(destination: ContentView()) {
              Label("Settings", systemImage: "gear")
            }
            NavigationLink { Text("Billing") } label: {
              Label("Billing", systemImage: "creditcard")
            }
            NavigationLink { ContentView() } label: {
              Label("Help", systemImage: "questionmark")
            }
          }
          .accentColor(.primary)
          .listRowSeparatorTint(.blue)
          .listRowSeparator(.hidden)
          
          Section {
            Link(destination: URL(string: "https://apple.com")!) {
              HStack {
                Label("Website", systemImage: "house")
                Spacer()
                Image(systemName: "link")
                  .foregroundColor(.secondary)
              }
            }
            Link(destination: URL(string: "https://youtube.com")!) {
              HStack {
                Label("YouTube", systemImage: "tv")
                Spacer()
                Image(systemName: "link")
                  .foregroundColor(.secondary)
              }
            }
          }
          .listRowSeparator(.hidden)
          .accentColor(.primary)
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Account")
      }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
