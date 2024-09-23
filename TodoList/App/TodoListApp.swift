//
//  TodoListApp.swift
//  TodoList
//
//  Created by Alperen Sarışan on 10.09.2024.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @State var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .navigationSplitViewStyle(.automatic)
            .environment(listViewModel)
        }
    }
}
