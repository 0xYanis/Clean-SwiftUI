//
//  ApiService.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 17.12.2023.
//

import Foundation

protocol ApiService: AnyObject {
    func fetch<T: Decodable>(from url: URL?) async throws -> [T]
}

class ApiServiceImpl: ApiService {
    
    func fetch<T: Decodable>(from url: URL?) async throws -> [T] {
        guard let url else { throw NSError() }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let models = try decoder.decode([T].self, from: data)
        return models
    }
    
}
