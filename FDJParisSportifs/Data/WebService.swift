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
}
