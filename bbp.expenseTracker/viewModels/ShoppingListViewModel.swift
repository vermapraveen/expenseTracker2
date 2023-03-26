//
//  ShoppingListViewModel.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/25/23.
//

import Combine

class ShoppingListViewModel: ObservableObject {
    @Published var items: [ShoppingListItem] = []

    func addItem(item: ShoppingListItem) {
        items.append(item)
    }

    func updateItem(item: ShoppingListItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item
        }
    }

    func removeItem(item: ShoppingListItem) {
        items.removeAll { $0.id == item.id }
    }
    
    func editItem(item: ShoppingListItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            let newItem = items[index]
            items[index] = ShoppingListItem(id: newItem.id, name: newItem.name, quantity: newItem.quantity, brand: newItem.brand, urgency: newItem.urgency, done: newItem.done)
        }
    }
}
