//
//  WebService.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 07/01/2023.
//

import Foundation

final class WebService {
    private enum WebServiceError: Error {
        case encodingURL
        case invalidURL
        case dataRecoveryFailure
    }
    
    private enum WebServiceEndPoint: String {
        case allLeagues = "all_leagues.php"
        case allLeagueTeams = "search_all_teams.php?l="
        case teamInformations = "searchteams.php?t="
    }
    
    private let apiKey: String = "50130162"
    private let rootUrl: String = "https://www.thesportsdb.com/api/v1/json/"
    
    private func makeURLRequest(_ endPoint: WebServiceEndPoint, _ paramEncoded: String?) throws -> URL {
        let urlString = rootUrl + apiKey + "/" + endPoint.rawValue + (paramEncoded ?? "")
        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            throw WebServiceError.invalidURL
        }
        return url
    }
    
    // MARK: - API Calls

    func fetchAllLeagues() async throws -> [League] {
        var leagues = [League]()
        let endpoint: WebServiceEndPoint = .allLeagues
        
        guard let url: URL = try? makeURLRequest(endpoint, nil)
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
    
    func fetchAllLeagueTeams(strLeague: String) async throws -> [Team] {
        var teams = [Team]()
        let endpoint: WebServiceEndPoint = .allLeagueTeams
        
        guard let urlEncoded: String = strLeague.addingPercentEncoding(withAllowedCharacters: .alphanumerics)
        else { throw WebServiceError.encodingURL }
   
        guard let url: URL = try? makeURLRequest(endpoint, urlEncoded)
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
    
    /// Récupérer les informations de l'équipe
    /// - Parameter strTeam: Nom de l'équipe
    /// - Returns: L'équipe et ses informations
    func fetchTeamInformations(strTeam: String) async throws -> Team {
        var team: Team? = nil
        let endpoint: WebServiceEndPoint = .teamInformations
        
        guard let urlEncoded: String = strTeam.addingPercentEncoding(withAllowedCharacters: .alphanumerics)
        else {
            throw WebServiceError.encodingURL
        }
        guard let url: URL = try? makeURLRequest(endpoint, urlEncoded)
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
