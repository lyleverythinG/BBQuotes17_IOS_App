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
            ForEach(Constants.Tabs.all, id: \.title) { tab in
                tabItemView(for: tab)
            }
        }
        .preferredColorScheme(.dark)
    }
    
    /// Creates a tab item view for a given tab configuration.
    /// - Note: This function uses `FetchView` to display the content of the tab.
    @ViewBuilder
    private func tabItemView(for tab: Constants.Tabs.Tab) -> some View {
        FetchView(show: tab.title)
            .toolbarBackground(.visible, for: .tabBar)
            .tabItem {
                Label(tab.title, systemImage: tab.systemImage)
            }
    }
}

#Preview {
    ContentView()
}
