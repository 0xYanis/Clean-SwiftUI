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
        Text("User List")
    }
    
}

#if DEBUG
struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListAssembly.shared.build()
    }
}
#endif
