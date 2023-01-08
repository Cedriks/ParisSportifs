//
//  TeamInformations.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 08/01/2023.
//

import Foundation

class TeamInformations {
    
    /// Récupérer les informations de l'équipe
    /// - Parameter strTeam: Nom de l'équipe
    /// - Returns: L'équipe et ses informations
    func fetchTeamInformations(strTeam: String) async throws -> Team {
        var team: Team? = nil
        let endpoint: WebServiceEndPoint = .teamInformations
        let webService = WebService()
        
        guard let urlEncoded: String = strTeam.addingPercentEncoding(withAllowedCharacters: .alphanumerics)
        else {
            throw WebServiceError.encodingURL
        }
        guard let url: URL = try? webService.makeURLRequest(endpoint, urlEncoded)
        else {
            throw WebServiceError.invalidURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let items = try JSONDecoder().decode(Result.self, from: data)
            if let itemsteams = items.teams {
                team = itemsteams.first
            }
        } catch {
            print(error)
            throw WebServiceError.dataRecoveryFailure
        }
        guard (team != nil) else {
            throw  WebServiceError.dataRecoveryFailure
        }
        return team!
    }
}
