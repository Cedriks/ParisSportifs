//
//  TeamInformationNetworker.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 08/01/2023.
//

import Foundation

protocol TeamInformationNetworking {
    func fetchTeamInformation(strTeam: String) async throws -> Team
}

final class TeamInformationNetworker: TeamInformationNetworking {
    private let webService: WebServiceProtocol
    private let urlSession: URLSession
    
    init(webService: WebServiceProtocol = WebService(), urlSession: URLSession = .shared) {
        self.webService = webService
        self.urlSession = urlSession
    }
    
    func fetchTeamInformation(strTeam: String) async throws -> Team {
        var team: Team?
        let endpoint: WebServiceEndPoint = .teamInformations
        
        //TODO: extraire
        guard let urlEncoded: String = strTeam.addingPercentEncoding(withAllowedCharacters: .alphanumerics) else {
            throw WebServiceError.encodingURL
        }
        guard let url: URL = try? webService.makeURL(endpoint, urlEncoded) else {
            throw WebServiceError.invalidURL
        }
        
        do {
            let (data, _) = try await urlSession.data(from: url)
            let items = try JSONDecoder().decode(Result.self, from: data)
            if let itemsteams = items.teams {
                team = itemsteams.first
            }
        } catch {
            print(error)
            throw WebServiceError.dataRecoveryFailure
        }
        if let team = team {
            return team
        } else {
            throw WebServiceError.dataRecoveryFailure
        }
    }
}
