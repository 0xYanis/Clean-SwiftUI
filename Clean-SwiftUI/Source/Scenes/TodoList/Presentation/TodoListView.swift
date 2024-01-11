//
//  TodoListView.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 18.12.2023.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: TodoListViewModel
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        List {
            Section {
                TodoListProfile(person: viewModel.person)
            }
            
            todoList()
        }
        .onAppear(perform: viewModel.request)
        .navigationTitle(viewModel.person.name)
        .searchable(text: $viewModel.searchText)
    }
    
    private func systemImage(completed: Bool) -> some View {
        Image(systemName: completed ? "checkmark.seal.fill" : "xmark.seal")
            .foregroundStyle(.white, completed ? .green : .red)
    }
    
    @ViewBuilder
    private func todoList() -> some View {
        Section {
            if viewModel.todos.isEmpty {
                ProgressView()
                    .frame(maxWidth: .infinity, alignment: .center)
            } else {
                ForEach(viewModel.todos) { todo in
                    Label {
                        Text(todo.title)
                    } icon: {
                        systemImage(completed: todo.completed)
                    }
                }
            }
        } header: {
            Text("Todo")
        }
    }
    
}

struct TodoListProfile: View {
    var person: UserListModel.ViewModel
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(Color.secondary.opacity(0.15))
                    .frame(width: 45, height: 45)
                    .cornerRadius(6)
                
                Text("🤗")
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(person.name)
                
                Text(person.email)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
    }
    
}
