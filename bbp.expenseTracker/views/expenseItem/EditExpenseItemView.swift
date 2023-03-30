//
//  EditExpenseItemView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/29/23.
//

import SwiftUI

struct EditExpenseItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenseItemViewModel: ExpenseItemViewModel
    @StateObject var unitTypeViewModel = UnitTypeViewModel()
    @State var item: ExpenseItem

    @State private var name: String = ""
    @State private var pricePerUnit: String = ""
    @State private var selectedUnitType: UnitType?
    @State private var unitPurchased: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Item Details")) {
                    TextField("Name", text: $name)
                    TextField("Price Per Unit", text: $pricePerUnit)
                        .keyboardType(.decimalPad)

                    Picker("Unit Type", selection: $selectedUnitType) {
                        ForEach(unitTypeViewModel.unitTypes) { unitType in
                            Text(unitType.name).tag(unitType as UnitType?)
                        }
                    }

                    TextField("Units Purchased", text: $unitPurchased)
                        .keyboardType(.numberPad)
                }
            }
            .navigationBarTitle("Edit Expense Item")
            .navigationBarItems(
                leading:
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    },
                trailing:
                    Button("Save") {
                        if let index = expenseItemViewModel.expenseItems.firstIndex(where: { $0.id == item.id }) {
                            expenseItemViewModel.expenseItems[index].name = name
                            expenseItemViewModel.expenseItems[index].pricePerUnit = Double(pricePerUnit) ?? 0.0
                            expenseItemViewModel.expenseItems[index].unitType = selectedUnitType?.name ?? ""
                            expenseItemViewModel.expenseItems[index].unitsPurchased = Int(unitPurchased) ?? 0
                        }
                        presentationMode.wrappedValue.dismiss()
                    }
            )
            .onAppear {
                name = item.name
                pricePerUnit = "\(item.pricePerUnit)"
                selectedUnitType = unitTypeViewModel.unitTypes.first(where: { $0.name == item.unitType })
                unitPurchased = "\(item.unitsPurchased)"
            }
        }
    }
}
