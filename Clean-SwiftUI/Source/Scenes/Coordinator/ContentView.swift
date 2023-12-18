//
//  ContentView.swift
//  Clean-SwiftUI
//
//  Created by Yanis on 18.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject
    private var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .userList)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
        }
        .environmentObject(coordinator)
    }
    
}
