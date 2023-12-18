//
//  TodoListPresenter.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 18.12.2023.
//

import Foundation

protocol TodoListPresentationLogic: AnyObject {
    func presentTodos(_ response: [TodoListModel.Response])
}

class TodoListPresenter: TodoListPresentationLogic {
    
    weak var viewModel: TodoListDisplayLogic?
    
    func presentTodos(_ response: [TodoListModel.Response]) {
        let models = response.map {
            TodoListModel.ViewModel(
                id: $0.id - (response.first?.id ?? 0) + 1,
                title: $0.title,
                completed: $0.completed)
        }
        viewModel?.displayTodos(models)
    }
    
}
