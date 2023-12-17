//
//  UserListRepository.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 17.12.2023.
//

import Foundation

protocol UserListRepository: AnyObject {
    func fetchUserList(query: String) async -> [UserListModel.Response]
}

final class UserListRepositoryImpl: UserListRepository {
    
    private var apiService: ApiService
    
    init() {
        self.apiService = ApiServiceImpl()
    }
    
    func fetchUserList(query: String) async -> [UserListModel.Response] {
        let url = URL(string: newUrlString(query))
        let list = try? await apiService.fetch(from: url) as [UserListModel.Response]
        return list ?? []
    }
    
}

private extension UserListRepositoryImpl {
    func newUrlString(_ query: String) -> String {
        "https://jsonplaceholder.typicode.com/users?=\(query)"
    }
}
