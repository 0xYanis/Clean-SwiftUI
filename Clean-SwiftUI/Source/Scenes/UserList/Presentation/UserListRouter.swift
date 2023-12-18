//
//  UserListRouter.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 18.12.2023.
//

import Foundation

protocol UserListNavigation: AnyObject {
    func showUserTodos(id: Int)
}

class UserListRouter: UserListNavigation {
    
    weak var coordinator: Coordinator?
    
    func showUserTodos(id: Int) {
        
    }
    
}
