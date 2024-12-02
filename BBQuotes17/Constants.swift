//
//  Constants.swift
//  BBQuotes17
//
//  Created by Lyle Dane Carcedo on 11/30/24.
//

import Foundation

enum Constants {
    static let breakingBadName = "Breaking Bad"
    static let betterCallSaulName = "Better Call Saul"
    static let elCaminoName = "El Camino"
    
    struct Tabs {
        struct Tab {
            let title: String
            let systemImage: String
        }
        static let all = [
            Tab(title: breakingBadName, systemImage: "tortoise"),
            Tab(title: betterCallSaulName, systemImage: "briefcase"),
            Tab(title: elCaminoName, systemImage: "car")
        ]
    }
}
