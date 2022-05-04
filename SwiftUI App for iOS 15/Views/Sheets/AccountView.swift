//
//  AccountView.swift
//  SwiftUI App for iOS 15
//
//  Created by Gonzalo Alfonso on 19/04/2022.
//

import SwiftUI

struct AccountView: View {
  
  @State var isDeleted: Bool = false
  @State var isPinned: Bool = false
  @State var adress: Adress = Adress(id: 1, country: "Argentina")
  @Environment(\.dismiss) var dismiss
  @AppStorage("isLogged") var isLogged: Bool = false
  @AppStorage("isLiteMode") var isLiteMode: Bool = true
  @ObservedObject var coinModel = CoinModel()
  
  func fetchAdress() async {
    do {
      let url = URL(string: "https://random-data-api.com/api/address/random_address")!
      let (data, _) = try await URLSession.shared.data(from: url)
      adress = try JSONDecoder().decode(Adress.self, from: data)
    } catch {
      adress = Adress(id: 1, country: "Error fetching data")
    }
    
  }
  
  var body: some View {
    NavigationView {
      List {
        
        profile
        
        menu
        
        Section {
          Toggle(isOn: $isLiteMode) {
            Label("Lite Mode", systemImage: isLiteMode ? "tortoise" : "hare")
          }
        }
        .accentColor(.primary)
        
        links
        
        coins
        
        Button {
          isLogged = false
          dismiss()
        } label: {
          Text("Sign out")
        }
        .tint(.red)
      }
      .task {
        await fetchAdress()
        await coinModel.fetchCoins()
      }
      .refreshable {
        await fetchAdress()
        await coinModel.fetchCoins()
      }
      .listStyle(.insetGrouped)
      .navigationTitle("Account")
      .navigationBarItems(trailing: Button { dismiss() } label: { Text("Done").bold() })
    }
  }
  
  var profile: some View {
    
    VStack(spacing: 8) {
      Image(systemName: "person.crop.circle.badge.checkmark")
        .symbolVariant(.circle.fill)
        .font(.system(size: 32))
        .symbolRenderingMode(.palette)
        .foregroundStyle(.blue, .blue.opacity(0.3))
        .padding()
        .background(Circle().fill(.ultraThinMaterial))
        .background(
          HexagonView()
            .offset(x: -50, y: -100)
        )
        .background(
          BlobView()
            .offset(x: 200, y: 20)
            .scaleEffect(0.6)
        )
      Text("Gonzalo Alfonso")
        .font(.title.weight(.semibold))
      HStack {
        Image(systemName: "location")
          .imageScale(.large)
        Text(adress.country)
          .foregroundColor(.secondary)
      }
    }
    .frame(maxWidth: .infinity)
    .padding()
  }
  
  var menu: some View {
    
    Section {
      NavigationLink(destination: HomeView()) {
        Label("Settings", systemImage: "gear")
      }
      NavigationLink { Text("Billing") } label: {
        Label("Billing", systemImage: "creditcard")
      }
      NavigationLink { HomeView() } label: {
        Label("Help", systemImage: "questionmark")
      }
    }
    .accentColor(.primary)
    .listRowSeparatorTint(.blue)
    .listRowSeparator(.hidden)
  }
  
  var links: some View {
    
    Section {
      if !isDeleted {
        Link(destination: URL(string: "https://apple.com")!) {
          HStack {
            Label("Website", systemImage: "house")
            Spacer()
            Image(systemName: "link")
              .foregroundColor(.secondary)
          }
        }
        .swipeActions(edge: .leading, allowsFullSwipe: true) {
          Button(action: { isDeleted = true }) {
            Label("Delete", systemImage: "trash")
          }
          .tint(.red)
          pinButton
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
      .swipeActions {
        pinButton
      }
    }
    .listRowSeparator(.hidden)
    .accentColor(.primary)
  }
  
  var coins: some View {
    Section(header: Text("Coins")) {
      ForEach(coinModel.coins) { coin in
        HStack {
          AsyncImage(url: URL(string: coin.logo)) { image in
            image.resizable()
              .aspectRatio(contentMode: .fit)
          } placeholder: {
            ProgressView()
          }
          .frame(width: 32, height: 32)
          VStack(alignment: .leading, spacing: 4) {
            Text(coin.coin_name)
            Text(coin.acronym)
              .font(.caption)
              .foregroundColor(.secondary)
          }
        }
      }
    }
  }
  
  var pinButton: some View {
    
    Button { isPinned.toggle() } label: {
      if isPinned {
        Label("UnPin", systemImage: "pin.slash")
      } else {
        Label("Pin", systemImage: "pin")
      }
    }
    .tint(isPinned ? .gray : .yellow)
  }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
