//
//  ExpenseItemsListView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/29/23.
//

import SwiftUI

struct ExpenseItemsListView: View {
    @ObservedObject var expenseItemViewModel: ExpenseItemViewModel
    @State private var showEditExpenseItemView = false
    @State private var selectedItem: ExpenseItem?

    var body: some View {
        List {
            ForEach(expenseItemViewModel.expenseItems) { item in
                Text(item.name)
                    .contentShape(Rectangle())
                    .onTapGesture { }
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            if let index = expenseItemViewModel.expenseItems.firstIndex(where: { $0.id == item.id }) {
                                expenseItemViewModel.expenseItems.remove(at: index)
                            }
                        } label: {
                            Label("Remove", systemImage: "trash")
                        }
                    }
                    .swipeActions(edge: .leading) {
                        Button {
                            selectedItem = item
                            showEditExpenseItemView.toggle()
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                    }
            }
        }
        .sheet(item: $selectedItem) { item in
            EditExpenseItemView(expenseItemViewModel: expenseItemViewModel, item: item)
        }
    }
}
