//
//  TodoListView.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 18.12.2023.
//

import SwiftUI

struct TodoListView: View {
    
    @StateObject
    var viewModel: TodoListViewModel
    
    @EnvironmentObject
    var coordinator: Coordinator
    
    var body: some View {
        Text("todo list")
    }
    
}
