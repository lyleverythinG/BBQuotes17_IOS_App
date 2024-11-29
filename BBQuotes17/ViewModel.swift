//
//  ViewModel.swift
//  BBQuotes17
//
//  Created by Lyle Dane Carcedo on 11/29/24.
//

import Foundation

@Observable
class ViewModel {
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case failed(error:Error)
    }
    
    private(set)var status: FetchStatus = .notStarted
    
    private let fetcher = FetchService()
    
    var quote: Quote
    var character: Character
    
    // TODO: handle init function
    init() {
        
    }
}
