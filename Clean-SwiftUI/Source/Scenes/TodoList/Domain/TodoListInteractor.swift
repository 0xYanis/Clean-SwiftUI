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
    private var webRepository: TodoListRepository?
    
    init() {
        self.webRepository = TodoListRepositoryImpl()
    }
    
    func fetchTodos(_ request: TodoListModel.Request) {
        Task {
            let list = await webRepository?.fetchTodos(userId: request.userId)
            await MainActor.run(body: {
                presenter?.presentTodos(list ?? [])
            })
        }
    }
    
}
