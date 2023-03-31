//
//  Expense2View.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/31/23.
//

import SwiftUI

struct Expense2View: View {
    @State private var visits: [Visit] = testData
    @State private var searchText: String = ""
    @State private var filterApplied: Bool = false
    @State private var filter: Filter = Filter()

    var filteredVisits: [Visit] {
        var filtered = visits

        if !searchText.isEmpty {
            filtered = filtered.map { visit in
                var visitCopy = visit
                visitCopy.expenses = visit.expenses.filter { expense in
                    expense.name.lowercased().contains(searchText.lowercased())
                }
                return visitCopy
            }.filter { visit in
                !visit.expenses.isEmpty
            }
        }

        if filterApplied {
            filtered = filtered.filter { visit in(filter.store == nil || visit.storeName.lowercased() == filter.store?.lowercased()) &&
                (filter.dateRange == nil || visit.date >= filter.dateRange!.lowerBound && visit.date <= filter.dateRange!.upperBound) &&
                (filter.paymentMethod == nil || visit.paymentMethod.lowercased() == filter.paymentMethod?.lowercased())
            }

            filtered = filtered.map { visit in
                var visitCopy = visit
                visitCopy.expenses = visit.expenses.filter { expense in
                    (filter.expenseType == nil || expense.expenseType.lowercased() == filter.expenseType?.lowercased()) &&
                    (filter.incurredFor == nil || expense.incurredFor.lowercased() == filter.incurredFor?.lowercased())
                }
                return visitCopy
            }.filter { visit in
                !visit.expenses.isEmpty
            }
        }

        return filtered
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                FilterButton(filterApplied: $filterApplied, action: {
                    // Perform filtering action
                })
                List {
                    ForEach(visits) { visit in
                        NavigationLink(destination: VisitDetailView(visit: visit)) {
                            Text(visit.storeName)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle("Expenses")
            }
       }
    }
}

struct Filter {
    var store: String?
    var dateRange: ClosedRange<Date>?
    var expenseType: String?
    var paymentMethod: String?
    var incurredFor: String?
}

let testData: [Visit] = [
    Visit(storeName: "Supermarket A", date: Date(), amountPaid: 100.0, paymentMethod: "Cash", expenses: [
        Expense(name: "Milk", quantity: 2, unitType: "Bottle", ratePerUnit: 3.0, expenseType: "Grocery", incurredFor: "Personal"),
        Expense(name: "Bread", quantity: 1, unitType: "Loaf", ratePerUnit: 2.5, expenseType: "Grocery", incurredFor: "Personal")
    ]),
    Visit(storeName: "Supermarket B", date: Date(), amountPaid: 75.0, paymentMethod: "Credit Card", expenses: [
        Expense(name: "Eggs", quantity: 12, unitType: "Carton", ratePerUnit: 4.0, expenseType: "Grocery", incurredFor: "Personal"),
        Expense(name: "Cereal", quantity: 1, unitType: "Box", ratePerUnit: 5.0, expenseType: "Grocery", incurredFor: "Personal")
            ]),
    Visit(storeName: "Electronics Store", date: Date(), amountPaid: 250.0, paymentMethod: "Debit Card", expenses: [
        Expense(name: "Headphones", quantity: 1, unitType: "Piece", ratePerUnit: 150.0, expenseType: "Electronics", incurredFor: "Personal"),
        Expense(name: "USB Cable", quantity: 2, unitType: "Piece", ratePerUnit: 10.0, expenseType: "Electronics", incurredFor: "Personal")
    ])
]
