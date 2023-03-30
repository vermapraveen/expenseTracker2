//
//  ExpensesView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/29/23.
//
import SwiftUI

struct ExpensesView: View {
    @ObservedObject var expenseItemViewModel = ExpenseItemViewModel()
    @State private var showAddExpenseItemView = false

    var body: some View {
        NavigationView {
            ExpenseItemsListView(expenseItemViewModel: expenseItemViewModel)
                .navigationBarTitle("Expenses")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showAddExpenseItemView.toggle()
                        }) {
                            Image(systemName: "plus")
                        }.sheet(isPresented: $showAddExpenseItemView) {
                            AddExpenseItemView(expenseItemViewModel: expenseItemViewModel, visitId: UUID()) // Pass the actual visitId when available
                        }
                    }
                }
        }
    }
}
