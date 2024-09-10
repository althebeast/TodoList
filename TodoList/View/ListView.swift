//
//  ListView.swift
//  TodoList
//
//  Created by Alperen Sarışan on 10.09.2024.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first title", isCompleted: false),
        ItemModel(title: "This is the second title", isCompleted: true),
        ItemModel(title: "This is the third title", isCompleted: false),
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
                }
            }
            .navigationTitle("Todo List 📝")
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add") {
                        AddView()
                    }
                }
            }
        }
    }

#Preview {
    NavigationStack {
        ListView()
    }
}
