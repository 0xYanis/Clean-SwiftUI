//
//  TodoListViewModel.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 18.12.2023.
//

import Foundation

protocol TodoListDisplayLogic: AnyObject {
    func displayTodos(_ viewModel: [TodoListModel.ViewModel])
}

class TodoListViewModel: ObservableObject {
    
    var interactor: TodoListBusinessLogic?
    
    @Published
    var todos = [TodoListModel.ViewModel]()
    
    func request() {
        
    }
    
}

extension TodoListViewModel: TodoListDisplayLogic {
    
    func displayTodos(_ viewModel: [TodoListModel.ViewModel]) {
        
    }
    
}
