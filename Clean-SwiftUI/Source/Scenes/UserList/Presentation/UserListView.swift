//
//  UserListView.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 17.12.2023.
//

import SwiftUI

struct UserListView: View {
    
    @StateObject
    var viewModel: UserListViewModel
    
    @EnvironmentObject
    private var coordinator: Coordinator
    
    var body: some View {
        VStack {
            currentView
            .searchable(text: $viewModel.searchText)
            .onAppear(perform: viewModel.request)
            .navigationTitle("People")
        }
    }
    
    @ViewBuilder
    var currentView: some View {
        if viewModel.message.isEmpty {
            List(viewModel.people) { person in
                Button { coordinator.push(page: .todoList(person: person))
                } label: {
                    UserListCell(person: person)
                }
                .buttonStyle(.plain)
            }
            
        } else {
            ProgressView()
            Text(viewModel.message)
        }
    }
    
}

struct UserListCell: View {
    var person: UserListModel.ViewModel
    
    var body: some View {
        HStack(spacing: 15) {
            Text("\(person.id)")
                .font(.caption)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(person.name)
                
                Text(person.email)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
        }
    }
}

#if DEBUG
struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
