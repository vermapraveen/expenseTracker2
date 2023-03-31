//
//  VisitDetailView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/31/23.
//

import SwiftUI

struct VisitDetailView: View {
    @State private var expenses: [Expense]
    let visit: Visit
    
    init(visit: Visit) {
        self.visit = visit
        _expenses = State(initialValue: visit.expenses)
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(expenses) { expense in
                    ExpenseRowView(expense: $expenses[expenses.firstIndex(of: expense)!])
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
                }
                .listStyle(PlainListStyle())
                
                Button(action: addExpense) {
                    Text("Add Expense")
                }
                .padding()
            }
            .navigationTitle(visit.storeName)
            .navigationBarItems(trailing: EditButton())
        }
        
        private func delete(at offsets: IndexSet) {
            expenses.remove(atOffsets: offsets)
        }
        
        private func move(from source: IndexSet, to destination: Int) {
            expenses.move(fromOffsets: source, toOffset: destination)
        }
        
        private func addExpense() {
            let newExpense = Expense(name: "New Expense", quantity: 1, unitType: "Unit", ratePerUnit: 0.0, expenseType: "General", incurredFor: "Personal")
            expenses.append(newExpense)
        }
    }
