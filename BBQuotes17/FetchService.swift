//
//  FetchService.swift
//  BBQuotes17
//
//  Created by Lyle Dane Carcedo on 11/27/24.
//

import Foundation

struct FetchService {
    private enum FetchError: Error {
        case badResponse
    }
    
    private let baseURL = URL(string:"https://breaking-bad-api-six.vercel.app/api")!
    
    func fetchQuote(from show: String) async throws -> Quote {
        // Build fetch url
        let quoteURL = baseURL.appending(path: "quotes/random")
        let fetchURL = quoteURL.appending(queryItems:[URLQueryItem(name: "production", value: show)])
        
        // Fetch Data
        let (data, response) = try await URLSession.shared.data(from:fetchURL)
        
        // Handle Response
        guard let response = response as? HTTPURLResponse, response.statusCode == 200
        else {
            throw FetchError.badResponse
        }
        
        // Decode data
        let quote = try JSONDecoder().decode(Quote.self, from: data)
        
        // Return quote
        return quote
    }
    
    func fetchCharacter(_ name: String) async throws -> Character {
        let characterURL = baseURL.appending(path:"characters")
        let fetchURL = characterURL.appending(queryItems: [URLQueryItem(name: "name",value: name)])
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200
        else {
            throw FetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let characters = try decoder.decode([Character].self, from: data)
        
        return characters[0]
    }
    
    func fetchDeath(for character: String) async throws -> Death? {
        let fetchURL = baseURL.appending(path: "deaths")
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200
        else {
            throw FetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let deaths = try decoder.decode([Death].self, from: data)
        
        for death in deaths {
            if death.character == character {
                return death
            }
        }
        return nil
    }
    
    
    /**
     Fetches a random episode from the given show.

     - Note: The API only supports querying episodes using the `production` field, which specifies the show name
             (e.g., "Breaking Bad" or "Better Call Saul"). Other fields, such as episode ID or title, are not supported.
             As a result, all episodes are fetched first, and one is randomly selected. This may change in the future.

     - Parameter show: The name of the show to fetch episodes for (e.g., "Breaking Bad" or "Better Call Saul").
     - Returns: A random `Episode` object from the specified show, or `nil` if no episodes are found.
     - Throws: `FetchError` if there is an issue with the network request or decoding the data.
     */
    func fetchEpisode(from show: String) async throws -> Episode? {
        let episodeURL = baseURL.appending(path:"episodes")
        let fetchURL = episodeURL.appending(queryItems: [URLQueryItem(name: "production",value: show)])
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200
        else {
            throw FetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let episodes = try decoder.decode([Episode].self, from: data)
        
        return episodes.randomElement()
    }
}
