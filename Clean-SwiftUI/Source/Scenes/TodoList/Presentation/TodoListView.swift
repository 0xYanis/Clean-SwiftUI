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
            VStack {
                Text(viewModel.person.name)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .background(Color.secondary.opacity(0.12))
            .cornerRadius(6)
            .padding()
            
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
        .frame(maxWidth: .infinity)
        .background(Color.secondary.opacity(0.12))
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
