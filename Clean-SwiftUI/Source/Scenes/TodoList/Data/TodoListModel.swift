//
//  TodoListModel.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 18.12.2023.
//

import Foundation

enum TodoListModel {}

extension TodoListModel {
    struct Request {
        var userId: Int
    }
}

extension TodoListModel {
    struct Response: Decodable {
        let id: Int
        let userId: Int
        let title: String
        let completed: Bool
    }
}

extension TodoListModel {
    struct ViewModel: Identifiable {
        let id: Int
        let title: String
        let completed: Bool
    }
}
