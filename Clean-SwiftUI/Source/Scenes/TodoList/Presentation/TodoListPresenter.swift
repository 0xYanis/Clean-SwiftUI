//
//  TodoListPresenter.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 18.12.2023.
//

import Foundation

protocol TodoListPresentationLogic: AnyObject {
    
}

class TodoListPresenter: TodoListPresentationLogic {
    
    weak var viewModel: TodoListDisplayLogic?
    
}
