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
        
    }
}

extension TodoListModel {
    struct ViewModel: Identifiable {
        let id: Int
    }
}
