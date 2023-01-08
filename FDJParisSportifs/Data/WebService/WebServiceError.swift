//
//  WebServiceError.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 08/01/2023.
//

import Foundation

enum WebServiceError: Error {
    case encodingURL
    case invalidURL
    case dataRecoveryFailure
}
