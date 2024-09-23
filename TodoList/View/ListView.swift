//
//  ListView.swift
//  TodoList
//
//  Created by Alperen Sarışan on 10.09.2024.
//

import SwiftUI

struct ListView: View {
    
    @Environment(ListViewModel.self) var listViewModel
    
    var body: some View {
        
        @Bindable var listViewModel = listViewModel
        
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.filteredItems) { item in
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
                    .searchable(text: $listViewModel.search)
                    .onChange(of: listViewModel.search) {
                        listViewModel.searchItems()
                    }
            }
        }
        .onAppear(perform: {
            listViewModel.filteredItems = listViewModel.items
        })
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
    .environment(ListViewModel())
}
