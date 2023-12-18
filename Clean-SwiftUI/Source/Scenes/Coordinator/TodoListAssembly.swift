//
//  TodoListAssembly.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 18.12.2023.
//

import SwiftUI

class TodoListAssembly {
    static let shared = TodoListAssembly()
    
    func build() -> some View {
        let viewModel = TodoListViewModel()
        let interactor = TodoListInteractor()
        let presenter = TodoListPresenter()
        
        viewModel.interactor = interactor
        interactor.presenter = presenter
        presenter.viewModel = viewModel
        
        return TodoListView(viewModel: viewModel)
    }
    
}
