//
//  WebService.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 07/01/2023.
//

import Foundation

protocol WebServiceProtocol {
    func makeURL(_ endPoint: WebServiceEndPoint, _ paramEncoded: String?) throws -> URL
}

final class WebService: WebServiceProtocol {
    private let apiKey: String = "50130162"
    private let rootUrl: String
    
    init(rooUrl: String = "https://www.thesportsdb.com/api/v1/json/") {
        self.rootUrl = rooUrl
    }
    
    func makeURL(_ endPoint: WebServiceEndPoint, _ paramEncoded: String?) throws -> URL {
        let urlString = rootUrl + apiKey + "/" + endPoint.rawValue + (paramEncoded ?? "")
        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            throw WebServiceError.invalidURL
        }
        return url
    }
}
