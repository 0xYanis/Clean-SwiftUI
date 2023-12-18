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
        ScrollView {
            VStack(spacing: 15) {
                TodoListProfile(person: viewModel.person)
            }
            .modifier(CellModifier())
            
            Text("Todo notes")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .bottom])
            
            ForEach(viewModel.todos) { todo in
                TodoListCell(todo: todo)
            }
            Spacer()
        }
        .onAppear(perform: viewModel.request)
        .navigationTitle(viewModel.person.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct TodoListProfile: View {
    
    var person: UserListModel.ViewModel
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.secondary)
                .frame(width: 45, height: 45)
                .cornerRadius(6)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(person.name)
                Text(person.email)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(10)
    }
    
}

struct TodoListCell: View {
    
    var todo: TodoListModel.ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 15) {
                Text("\(todo.id)")
                    .padding(.leading, 10)
                    .font(.caption)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(todo.title)
                    
                    Text(todo.completed.description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
                Spacer()
            }
            .padding(5)
        }
        .modifier(CellModifier())
    }
    
}

struct CellModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .background(Color.secondary.opacity(0.1))
            .cornerRadius(6)
            .padding(.horizontal)
            .padding(.bottom, 5)
    }
}

struct TodoListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
