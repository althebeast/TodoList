//
//  ListViewModel.swift
//  TodoList
//
//  Created by Alperen Sarışan on 10.09.2024.
//

import Foundation
import Observation

@Observable
class ListViewModel {
    
    var search = ""
    var items: [ItemModel] = [] {
        didSet { //what didSet does is that whenever we change something in this items array it calls didSet and it calls saveItems which is are userDefaults
            saveItems()
        }
    }
    var filteredItems: [ItemModel] = []
    
    let itemsKey = "items_key"
    
    init() {
        getItems()
    }
    
    func getItems(){
        
//        let newItems = [
//            ItemModel(title: "This is the first title", isCompleted: false),
//            ItemModel(title: "This is the second title", isCompleted: true),
//            ItemModel(title: "This is the third title", isCompleted: false),
//        ]
//        items.append(contentsOf: newItems)
        
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedData = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        // if data and savedData both exist and they're not nil;
        self.items = savedData
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
        filteredItems.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
        filteredItems.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        
        if let index = filteredItems.firstIndex(where: { $0.id == item.id }) {
            filteredItems[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    func searchItems() {
        if search.isEmpty {
            filteredItems = items
        } else {
            filteredItems = items.filter { $0.title.contains(search) }
        }
    }
}
