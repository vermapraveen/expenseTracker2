//
//  ShoppingListItem.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/25/23.
//

import Foundation

struct ShoppingListItem: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var quantity: Int
    var brand: String
    var urgency: String
    var done: Bool
}
