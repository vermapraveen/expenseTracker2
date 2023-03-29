//
//  AddExpenseItemView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/29/23.
//

import SwiftUI

struct AddExpenseItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenseItemViewModel: ExpenseItemViewModel
    @StateObject var unitTypeViewModel = UnitTypeViewModel()
    let visitId: UUID

    @State private var name: String = ""
    @State private var pricePerUnit: String = ""
    @State private var selectedUnitType: UnitType?
    @State private var unitPurchased: String = ""

    @State private var showAddUnitTypeView = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Item Details")) {
                    TextField("Name", text: $name)
                    TextField("Price Per Unit", text: $pricePerUnit)
                        .keyboardType(.decimalPad)
                    
                    HStack {
                        Picker("Unit Type", selection: $selectedUnitType) {
                            ForEach(unitTypeViewModel.unitTypes) { unitType in
                                Text(unitType.name).tag(unitType as UnitType?)
                            }
                        }
                        
                        Button(action: {
                            showAddUnitTypeView.toggle()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.blue)
                                .imageScale(.large)
                        }.sheet(isPresented: $showAddUnitTypeView) {
                            // Implement AddUnitTypeView and pass the required view model
                        }
                    }
                    
                    TextField("Units Purchased", text: $unitPurchased)
                        .keyboardType(.numberPad)
                }
            }
            .navigationBarTitle("Add Expense Item")
            .navigationBarItems(
                leading:
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    },
                trailing:
                    Button("Save") {
                        let newItem = ExpenseItem(
                            id: UUID(),
                            visitId: visitId,
                            name: name,
                            pricePerUnit: Double(pricePerUnit) ?? 0.0,
                            unitType: selectedUnitType?.name ?? "",
                            unitsPurchased: Int(unitPurchased) ?? 0
                        )
                        expenseItemViewModel.expenseItems.append(newItem)
                        presentationMode.wrappedValue.dismiss()
                    }
            )
        }
    }
}
