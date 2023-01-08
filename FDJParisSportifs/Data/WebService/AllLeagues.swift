//
//  AllLeagues.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 08/01/2023.
//

import Foundation

class AllLeagues {
    func fetchAllLeagues() async throws -> [League] {
        var leagues = [League]()
        let endpoint: WebServiceEndPoint = .allLeagues
        let webService = WebService()
        
        guard let url: URL = try? webService.makeURLRequest(endpoint, nil)
        else { throw WebServiceError.invalidURL }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
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
