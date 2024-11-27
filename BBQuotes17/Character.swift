//
//  Character.swift
//  BBQuotes17
//
//  Created by Lyle Dane Carcedo on 11/27/24.
//

import Foundation

struct Character: Decodable {
    let name: String
    let birthday: String
    let occupations: [String]
    let images: [URL]
    let aliases: [String]
    let status: String
    let portrayedBy: String
    let death: Death?
}
                        
