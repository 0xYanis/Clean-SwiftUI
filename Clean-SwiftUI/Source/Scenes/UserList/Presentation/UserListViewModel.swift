//
//  UserListViewModel.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 17.12.2023.
//

import Foundation

protocol UserListDisplayLogic: AnyObject {
    func showPeople(_ viewModel: [UserListModel.ViewModel])
    func showMessage(_ message: String)
}

class UserListViewModel: ObservableObject {
    
    // MARK: - Public properties
    
    var interactor: UserListBusinessLogic?
    
    // MARK: - Publishers
    
    @Published var people = [UserListModel.ViewModel]()
    @Published var searchText = "" { didSet { request() } }
    @Published var message = ""
    
    // MARK: - Public methods
    
    func request() {
        interactor?.searchPeople(.init(text: searchText))
    }
    
}

// MARK: - UserListDisplayLogic

extension UserListViewModel: UserListDisplayLogic {
    
    func showPeople(_ viewModel: [UserListModel.ViewModel]) {
        message.removeAll()
        self.people = viewModel
    }
    
    func showMessage(_ message: String) {
        self.people.removeAll()
        self.message = message
    }
    
}
