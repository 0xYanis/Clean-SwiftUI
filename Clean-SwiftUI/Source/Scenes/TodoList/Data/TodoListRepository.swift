//
//  TodoListRepository.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 18.12.2023.
//

import Foundation

protocol TodoListRepository: AnyObject {
    func fetchTodos(userId: Int) async -> [TodoListModel.Response]
}

class TodoListRepositoryImpl: TodoListRepository {
    
    private var apiService: ApiService
    
    init() {
        self.apiService = ApiServiceImpl()
    }
    
    func fetchTodos(userId: Int) async -> [TodoListModel.Response] {
        let url = URL(string: newUrlString(userId))
        let list = try? await apiService.fetch(from: url) as [TodoListModel.Response]
        return list ?? []
    }
    
}

private extension TodoListRepositoryImpl {
    func newUrlString(_ userId: Int) -> String {
        "https://jsonplaceholder.typicode.com/todos?userId=\(userId)"
    }
}
