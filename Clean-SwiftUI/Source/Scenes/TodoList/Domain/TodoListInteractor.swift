//
//  TodoListInteractor.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 18.12.2023.
//

import Foundation

protocol TodoListBusinessLogic: AnyObject {
    func fetchTodos(_ request: TodoListModel.Request)
}

class TodoListInteractor: TodoListBusinessLogic {
    
    var presenter: TodoListPresentationLogic?
    private let webRepository: TodoListRepository
    
    init(webRepository: TodoListRepository) {
        self.webRepository = webRepository
    }
    
    func fetchTodos(_ request: TodoListModel.Request) {
        Task {
            let list = await webRepository.fetchTodos(userId: request.userId)
            await present(todos: list)
        }
    }
    
    private func present(todos: [TodoListModel.Response]) async {
        await MainActor.run(body: {
            presenter?.presentTodos(todos)
        })
    }
    
}
