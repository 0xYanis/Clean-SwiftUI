//
//  UserListModel.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 17.12.2023.
//

import Foundation

enum UserListModel {}

extension UserListModel {
    /// request to interactor from view
    struct Request {
        var text: String = ""
    }
}

extension UserListModel {
    /// response to presenter from interactor
    struct Response: Decodable {
        let id: Int
        let name, username, email: String
        let address: Address
        let phone, website: String
        let company: Company
        
        struct Address: Decodable {
            let street, suite, city, zipcode: String
            let geo: Geo
        }

        struct Geo: Decodable {
            let lat, lng: String
        }

        struct Company: Decodable {
            let name, catchPhrase, bs: String
        }
    }
}

extension UserListModel {
    /// model to view from presenter
    struct ViewModel: Identifiable {
        let id: Int
        let name, username, email: String
        let address: String
        let phone, website: String
        let company: String
    }
}
