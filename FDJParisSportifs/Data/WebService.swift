//
//  WebService.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 07/01/2023.
//

import Foundation

class WebService {
    enum WebServiceError: Error {
        case invalidURL
        case dataRecoveryFailure
    }
    
    let apiKey : String = "50130162"
    let rootUrl : String = "https://www.thesportsdb.com/api/v1/json/"
    
    func createURLRequest(_ endPoint: String) throws -> URL {
        let urlString = rootUrl + apiKey + "/" + endPoint
        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            throw WebServiceError.invalidURL
        }
        
        return url
    }
    
    // MARK: - API Calls
    
    /// Récupérer toutes les ligues
    /// - Returns: Tableau de leagues
    func fetchAllLeagues() async throws -> [League] {
        var leagues = [League]()
        let endpoint = "all_leagues.php"
        
        do {
            let url: URL = try createURLRequest(endpoint)
            let (data, _) = try await URLSession.shared.data(from: url)
            let items = try JSONDecoder().decode(Result.self, from: data)
            leagues = items.leagues!
        } catch {
            print(error)
            throw WebServiceError.dataRecoveryFailure
        }
        return leagues
    }
    
    /// Récupérer toutes les équipes d'une ligue
    /// - Parameter strLeague:Nom de la ligue
    /// - Returns: Tableau d'équipes
    func fetchAllLeagueTeams(strLeague: String) async throws -> [Team] {
       var teams = [Team]()
        let urlEncoded: String = strLeague.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
        let endpoint: String = "search_all_teams.php?l=" + urlEncoded
    
        do {
            let url: URL = try createURLRequest(endpoint)
            let (data, _) = try await URLSession.shared.data(from: url)
            let items = try JSONDecoder().decode(Result.self, from: data)
            teams = items.teams!
        } catch {
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
        let urlEncoded: String = strTeam.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
        let endpoint: String = "searchteams.php?t=" + urlEncoded
        
        do {
            let url: URL = try createURLRequest(endpoint)
            let (data, _) = try await URLSession.shared.data(from: url)
            let items = try JSONDecoder().decode(Result.self, from: data)
            team = items.teams!.first
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
