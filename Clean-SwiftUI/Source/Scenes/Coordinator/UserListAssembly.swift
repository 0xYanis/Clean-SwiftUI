//
//  UserListAssembly.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 17.12.2023.
//

import SwiftUI

class UserListAssembly {
    static let shared = UserListAssembly()
    
    func build() -> some View {
        let service = ApiServiceImpl()
        let repository = UserListRepositoryImpl(apiService: service)
        let interactor = UserListInteractor(webRepository: repository)
        let viewModel = UserListViewModel()
        let presenter = UserListPresenter()
        
        viewModel.interactor = interactor
        interactor.presenter = presenter
        presenter.viewModel = viewModel
        
        return UserListView(viewModel: viewModel)
    }
    
}
