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
                .tabItem { Label("Home", systemImage: "house") }
                .tag("Home")
            WalletView()
                .tabItem { Label("Wallet", systemImage: "wallet.pass") }
                .tag("Wallet")
            NotifsVIew()
                .tabItem { Label("Notifs", systemImage: "bell") }
                .tag("Notifs")
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
                .tag("Profile")
        }
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
