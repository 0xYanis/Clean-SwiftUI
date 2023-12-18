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
        let viewModel = UserListViewModel()
        let interactor = UserListInteractor()
        let presenter = UserListPresenter()
        let view = UserListView(viewModel: viewModel)
        
        viewModel.interactor = interactor
        interactor.presenter = presenter
        presenter.viewModel = viewModel
        
        return view
    }
    
}
