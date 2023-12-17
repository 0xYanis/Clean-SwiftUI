//
//  UserListPresenter.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 17.12.2023.
//

import Foundation

protocol UserListPresentationLogic: AnyObject {
    func presentPeople(_ response: [UserListModel.Response])
}

class UserListPresenter: UserListPresentationLogic {
    
    weak var viewModel: UserListDisplayLogic?
    
    func presentPeople(_ response: [UserListModel.Response]) {
        
    }
    
}
