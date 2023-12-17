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
    
    var body: some View {
        NavigationStack {
            VStack {
                currentView
            }
        }
    }
    
    @ViewBuilder
    var currentView: some View {
        if viewModel.message.isEmpty {
            List(viewModel.people) { person in
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
            .searchable(text: $viewModel.searchText)
            .onAppear(perform: viewModel.request)
            .navigationTitle("People")
        } else {
            ProgressView()
            Text(viewModel.message)
                .searchable(text: $viewModel.searchText)
        }
    }
    
}

#if DEBUG
struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListAssembly.shared.build()
    }
}
#endif
