//
//  ItemModel.swift
//  TodoList
//
//  Created by Alperen Sarışan on 10.09.2024.
//

import Foundation

struct ItemModel: Identifiable {
    
    let id = UUID()
    let title: String
    let isCompleted: Bool
}
