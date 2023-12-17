//
//  UserListInteractor.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 17.12.2023.
//

import Foundation

protocol UserListBusinessLogic: AnyObject {
    func searchPeople(_ request: UserListModel.Request)
}

class UserListInteractor: UserListBusinessLogic {
    
    var presenter: UserListPresentationLogic?
    var webRepository: UserListRepository?
    
    init() {
        self.webRepository = UserListRepositoryImpl()
    }
    
    func searchPeople(_ request: UserListModel.Request) {
        
    }
    
}
