//
//  ExpenseRowView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/31/23.
//

import SwiftUI

struct ExpenseRowView: View {
    @Binding var expense: Expense

    var body: some View {
        HStack {
            Text(expense.name)
            Spacer()
            Text("\(expense.quantity) \(expense.unitType)")
            Spacer()
            Text("$\(expense.ratePerUnit, specifier: "%.2f")")
        }
    }
}
