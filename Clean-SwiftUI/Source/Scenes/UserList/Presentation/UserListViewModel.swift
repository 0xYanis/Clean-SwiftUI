//
//  UserListViewModel.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 17.12.2023.
//

import Foundation

protocol UserListDisplayLogic: AnyObject {
    func showPeople(_ viewModel: [UserListModel.ViewModel])
}

class UserListViewModel: ObservableObject {
    
    var interactor: UserListBusinessLogic?
    
    @Published var people = [UserListModel.ViewModel]()
    @Published var searchText = "" { didSet { request() } }
    
    func request() {
        interactor?.searchPeople(.init(text: searchText))
    }
    
}

extension UserListViewModel: UserListDisplayLogic {
    
    func showPeople(_ viewModel: [UserListModel.ViewModel]) {
        self.people = viewModel
    }
    
}
