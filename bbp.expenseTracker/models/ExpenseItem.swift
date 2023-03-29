//
//  ExpenseItem.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/27/23.
//

import Foundation

struct ExpenseItem: Identifiable, Equatable {
    var id = UUID()
    var visitId: UUID
    var name: String
    var pricePerUnit: Double
    var unitType: String
    var unitsPurchased: Int
}
