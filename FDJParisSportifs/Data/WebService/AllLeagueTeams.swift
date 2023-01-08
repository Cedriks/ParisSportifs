//
//  AllLeagueTeams.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 08/01/2023.
//

import Foundation

class AllLeagueTeams {
    func fetchAllLeagueTeams(strLeague: String) async throws -> [Team] {
        var teams = [Team]()
        let endpoint: WebServiceEndPoint = .allLeagueTeams
        let webService = WebService()
        
        guard let urlEncoded: String = strLeague.addingPercentEncoding(withAllowedCharacters: .alphanumerics)
        else { throw WebServiceError.encodingURL }
        
        guard let url: URL = try? webService.makeURLRequest(endpoint, urlEncoded)
        else { throw WebServiceError.invalidURL }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
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
