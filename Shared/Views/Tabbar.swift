//
//  Tabbar.swift
//  KYND
//
//  Created by Patrick Johnson on 5/8/21.
//

import SwiftUI

struct Tabbar: View {
    @State var selection = "Home"
    var body: some View {
        TabView(selection: $selection){
            HomeView()
                .tabItem { Label("Home", systemImage: selection == "Home" ? "house.fill" : "house") }
                .tag("Home")
            WalletView()
                .tabItem { Label("Wallet", systemImage: selection == "Wallet" ? "wallet.pass.fill" : "wallet.pass") }
                .tag("Wallet")
            NotifsView()
                .tabItem { Label("Notifs", systemImage: selection == "Notifs" ? "bell.fill" : "bell") }
                .tag("Notifs")
            ProfileView()
                .tabItem { Label("Profile", systemImage: selection == "Profile" ? "person.fill" : "person") }
                .tag("Profile")
        }
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
