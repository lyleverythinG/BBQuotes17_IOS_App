//
//  ContentView.swift
//  BBQuotes17
//
//  Created by Lyle Dane Carcedo on 11/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            QuoteView(show: "Breaking Bad")
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("Breaking Bad", systemImage:
                            "tortoise")
                }
            
            QuoteView(show: "Better Call Saul")
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("Better Call Saul", systemImage:
                    "briefcase")
                }
            
            QuoteView(show: "El Camino")
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("El Camino", systemImage:
                            "car")
                }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
