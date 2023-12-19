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
    
    // MARK: - Public properties
    
    var interactor: TodoListBusinessLogic?
    
    // MARK: - Publishers
    
    @Published var todos = [TodoListModel.ViewModel]()
    @Published var person: UserListModel.ViewModel
    @Published var searchText = "" { didSet { search() } }
    
    // MARK: - Private methods
    
    private var allTodos = [TodoListModel.ViewModel]()
    
    // MARK: - Lifecycle
    
    init(person: UserListModel.ViewModel) {
        self.person = person
    }
    
    // MARK: - Public methods
    
    func request() {
        interactor?.fetchTodos(.init(userId: person.id))
    }
    
    // MARK: - Private methods
    
    private func search() {
        if searchText.isEmpty {
            self.todos = allTodos
        } else {
            self.todos = allTodos.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                "\($0.id)".localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
}

// MARK: - TodoListDisplayLogic

extension TodoListViewModel: TodoListDisplayLogic {
    
    func displayTodos(_ viewModel: [TodoListModel.ViewModel]) {
        self.allTodos = viewModel
        search()
    }
    
}
