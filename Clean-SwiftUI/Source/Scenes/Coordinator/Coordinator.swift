//
//  Coordinator.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 18.12.2023.
//

import SwiftUI

enum Page: Hashable {
    case userList
    case todoList(person: UserListModel.ViewModel)
}

final class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(page: Page) {
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
        case .todoList(let person):
            TodoListAssembly.shared.build(for: person)
        }
    }
}
