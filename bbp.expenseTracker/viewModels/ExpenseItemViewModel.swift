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
    let visitId = UUID()

    init() {
        let dummyData = [
            ExpenseItem(id: UUID(), visitId: visitId, name: "Milk", pricePerUnit: 1.25, unitType: "L", unitsPurchased: 2),
            ExpenseItem(id: UUID(), visitId: visitId, name: "Bread", pricePerUnit: 0.75, unitType: "Loaf", unitsPurchased: 1),
            ExpenseItem(id: UUID(), visitId: visitId, name: "Eggs", pricePerUnit: 2.50, unitType: "Dozen", unitsPurchased: 1)
                    ]
        self.expenseItems = dummyData
    }
    
    func addExpenseItem(name: String, visitId: UUID, pricePerUnit: Double, unitType: String, unitsPurchased: Int) {
        let newItem = ExpenseItem(visitId: visitId, name: name, pricePerUnit: pricePerUnit, unitType: unitType, unitsPurchased: unitsPurchased)
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
