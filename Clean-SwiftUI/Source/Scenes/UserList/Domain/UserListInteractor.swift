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
    private var webRepository: UserListRepository?
    
    init() {
        self.webRepository = UserListRepositoryImpl()
    }
    
    func searchPeople(_ request: UserListModel.Request) {
        Task {
            let list = await webRepository?.fetchUserList(query: request.text) ?? []
            await validation(list: list)
        }
    }
    
    private func validation(list: [UserListModel.Response]) async {
        await MainActor.run {
            list.isEmpty ? presenter?.presentError() : presenter?.presentPeople(list)
        }
    }
    
}
