//
//  expenseModels.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/31/23.
//

import Foundation

struct Visit: Identifiable {
    let id = UUID()
    let storeName: String
    let date: Date
    let amountPaid: Double
    let paymentMethod: String
    var expenses: [Expense]
}

struct Expense: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let quantity: Int
    let unitType: String
    let ratePerUnit: Double
    let expenseType: String
    let incurredFor: String

    static func == (lhs: Expense, rhs: Expense) -> Bool {
        return lhs.id == rhs.id
    }
}

