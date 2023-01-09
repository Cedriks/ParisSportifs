//
//  String+ext.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 09/01/2023.
//

import Foundation

extension String {
    func encodeURLparam() throws -> String {
        guard let encodedString: String = self.addingPercentEncoding(withAllowedCharacters: .alphanumerics) else {
            throw WebServiceError.encodingURL
        }
        return encodedString
    }
}
