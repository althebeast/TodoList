//
//  ListRowView.swift
//  TodoList
//
//  Created by Alperen Sarışan on 10.09.2024.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}


#Preview {
    
    VStack {
        ListRowView(item: ItemModel(title: "This is the first item", isCompleted: false))
        ListRowView(item: ItemModel(title: "This is the second item", isCompleted: true))
    }
}
