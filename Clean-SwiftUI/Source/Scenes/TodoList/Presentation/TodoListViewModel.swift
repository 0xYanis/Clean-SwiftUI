//
//  TodoListViewModel.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 18.12.2023.
//

import Foundation

protocol TodoListDisplayLogic: AnyObject {
    
}

class TodoListViewModel: ObservableObject {
    
    var interactor: TodoListBusinessLogic?
    
}

extension TodoListViewModel: TodoListDisplayLogic {
    
}
