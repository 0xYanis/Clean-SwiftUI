//
//  Coordinator.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 18.12.2023.
//

import SwiftUI

enum Page: String, Identifiable {
    case userList
    case todoList
    
    var id: String {
        self.rawValue
    }
}

protocol Routable: AnyObject {
    func pushTodos(id: Int)
    func pushUsers()
}

class Coordinator: ObservableObject {
    
    @Published
    var path = NavigationPath()
    
    func push(page: Page, id: Int? = nil) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .userList:
            UserListAssembly.shared.build()
        case .todoList:
            TodoListAssembly.shared.build()
        }
    }
    
}
