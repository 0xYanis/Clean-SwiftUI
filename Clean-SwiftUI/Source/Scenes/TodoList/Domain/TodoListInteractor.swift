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
    
    func fetchTodos(_ request: TodoListModel.Request) {
        
    }
    
}
