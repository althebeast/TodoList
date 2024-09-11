//
//  ListView.swift
//  TodoList
//
//  Created by Alperen Sarışan on 10.09.2024.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                        }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                    }
                    .listStyle(.plain)
            }
        }
            .navigationTitle("Todo List 📝")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .fontWeight(.semibold)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add") {
                        AddView()
                    }
                    .fontWeight(.semibold)
                }
            }
        }
    }

#Preview {
    NavigationStack {
        ListView()
    }
    .environmentObject(ListViewModel())
}
