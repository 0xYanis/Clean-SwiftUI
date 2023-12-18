//
//  TodoListAssembly.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 18.12.2023.
//

import SwiftUI

class TodoListAssembly {
    static let shared = TodoListAssembly()
    
    func build(for person: UserListModel.ViewModel) -> some View {
        let viewModel = TodoListViewModel(person: person)
        let interactor = TodoListInteractor()
        let presenter = TodoListPresenter()
        
        viewModel.interactor = interactor
        interactor.presenter = presenter
        presenter.viewModel = viewModel
        
        return TodoListView(viewModel: viewModel)
    }
    
}
