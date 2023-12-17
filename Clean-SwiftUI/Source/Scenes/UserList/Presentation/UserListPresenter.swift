//
//  UserListPresenter.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 17.12.2023.
//

import Foundation

protocol UserListPresentationLogic: AnyObject {
    func presentPeople(_ response: [UserListModel.Response])
    func presentError()
}

class UserListPresenter: UserListPresentationLogic {
    
    weak var viewModel: UserListDisplayLogic?
    
    func presentPeople(_ response: [UserListModel.Response]) {
        let models = response.map {
            UserListModel.ViewModel(
                id: $0.id,
                name: $0.name,
                username: $0.username,
                email: $0.email,
                address: $0.address.street + ", " + $0.address.city,
                phone: $0.phone,
                website: $0.website,
                company: $0.company.name)
        }
        viewModel?.showPeople(models)
    }
    
    func presentError() {
        viewModel?.showMessage("Invalid input 😯")
    }
    
}
