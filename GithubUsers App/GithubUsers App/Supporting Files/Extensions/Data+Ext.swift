//
//  Data+Ext.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import Foundation

// Extension to add a decode method for Data
extension Data {
    
    // Decodes the Data object into a Decodable type
    // Throws an error if decoding fails
    func decode<T: Decodable>() throws -> T {
        try JSONDecoder().decode(T.self, from: self)
    }
}
