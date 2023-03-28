//
//  ExpenseItemViewModel.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/27/23.
//

import Combine
import SwiftUI

class ExpenseItemViewModel: ObservableObject {
    @Published var expenseItems: [ExpenseItem] = []

    func addExpenseItem(name: String, pricePerUnit: Double, unitType: String, unitsPurchased: Int) {
        let newItem = ExpenseItem(name: name, pricePerUnit: pricePerUnit, unitType: unitType, unitsPurchased: unitsPurchased)
        expenseItems.append(newItem)
    }

    func updateExpenseItem(expenseItem: ExpenseItem, newName: String, newPricePerUnit: Double, newUnitType: String, newUnitsPurchased: Int) {
        if let index = expenseItems.firstIndex(of: expenseItem) {
            expenseItems[index].name = newName
            expenseItems[index].pricePerUnit = newPricePerUnit
            expenseItems[index].unitType = newUnitType
            expenseItems[index].unitsPurchased = newUnitsPurchased
        }
    }

    func removeExpenseItem(expenseItem: ExpenseItem) {
        expenseItems.removeAll { $0 == expenseItem }
    }
}
