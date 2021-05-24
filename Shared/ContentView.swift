//
//  ContentView.swift
//  Shared
//
//  Created by Patrick Johnson on 5/7/21.
//

import SwiftUI

struct ContentView: View {
    init() {
            UITextView.appearance().backgroundColor = .clear
        }
    var body: some View {
        Tabbar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
