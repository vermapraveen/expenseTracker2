//
//  ItemTypeViewModel.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import Combine
import SwiftUI

class ItemTypeViewModel: ObservableObject {
    @Published var ItemTypes: [ItemType] = [
        ItemType(name: "Fruit"),
        ItemType(name: "Vegetable"),
        ItemType(name: "Sweet"),
        ItemType(name: "Electicity"),
        ItemType(name: "Sales Tax"),
        ItemType(name: "Tip"),
        ItemType(name: "Delivery Charges")
    ]

    func addItemType(name: String) {
        let newItemType = ItemType(name: name)
        ItemTypes.append(newItemType)
    }

    func updateItemType(ItemType: ItemType, newName: String) {
        if let index = ItemTypes.firstIndex(of: ItemType) {
            ItemTypes[index].name = newName
        }
    }

    func removeItemType(ItemType: ItemType) {
        ItemTypes.removeAll { $0 == ItemType }
    }
}
