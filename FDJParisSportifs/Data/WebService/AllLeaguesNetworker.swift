//
//  AllLeagues.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 08/01/2023.
//

import Foundation

protocol AllLeaguesNetworking {
    func fetchAllLeagues() async throws -> [League]
}

final class AllLeaguesNetworker: AllLeaguesNetworking {
    private let webService: WebServiceProtocol
    private let urlSession: URLSession
    
    init(webService: WebServiceProtocol = WebService(), urlSession: URLSession = .shared) {
        self.webService = webService
        self.urlSession = urlSession
    }
    
    func fetchAllLeagues() async throws -> [League] {
        var leagues = [League]()
        let endpoint: WebServiceEndPoint = .allLeagues
        
        guard let url: URL = try? webService.makeURL(endpoint, nil) else {
            throw WebServiceError.invalidURL
        }
        
        do {
            let (data, _) = try await urlSession.data(from: url)
            let items = try JSONDecoder().decode(Result.self, from: data)
            if let itemsleagues = items.leagues {
                leagues = itemsleagues
            }
        } catch {
            print("Fetching \(url.absoluteString)...")
            throw WebServiceError.dataRecoveryFailure
        }
        return leagues
    }
}
