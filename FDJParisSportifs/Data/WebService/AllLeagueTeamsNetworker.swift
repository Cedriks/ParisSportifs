//
//  AllLeagueTeams.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 08/01/2023.
//

import Foundation

protocol AllLeagueTeamsNetworking {
    func fetchAllLeagueTeams(strLeague: String) async throws -> [Team]
}

final class AllLeagueTeamsNetworker: AllLeagueTeamsNetworking {
    private let webService: WebServiceProtocol
    private let urlSession: URLSession
    
    init(webService: WebServiceProtocol = WebService(), urlSession: URLSession = .shared) {
        self.webService = webService
        self.urlSession = urlSession
    }
    
    func fetchAllLeagueTeams(strLeague: String) async throws -> [Team] {
        var teams = [Team]()
        let endpoint: WebServiceEndPoint = .allLeagueTeams
        
        //TODO: extraire
        guard let urlEncoded: String = strLeague.addingPercentEncoding(withAllowedCharacters: .alphanumerics)
        else { throw WebServiceError.encodingURL }
        
        guard let url: URL = try? webService.makeURL(endpoint, urlEncoded)
        else { throw WebServiceError.invalidURL }
        
        do {
            let (data, _) = try await urlSession.data(from: url)
            let items = try JSONDecoder().decode(Result.self, from: data)
            if let itemsteams = items.teams {
                teams = itemsteams
            }
        } catch {
            print("Fetching \(url.absoluteString)...")
            print(error)
            throw WebServiceError.dataRecoveryFailure
        }
        return teams
    }
}
