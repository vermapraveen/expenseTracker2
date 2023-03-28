//
//  AddItemView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/25/23.
//

import SwiftUI

struct AddItemView: View {
    @ObservedObject var viewModel: ShoppingListViewModel
    @Binding var isPresented: Bool

    @State private var name = ""
    @State private var quantity = 1
    @State private var brand = ""
    @State private var urgency = "Low"
    @State private var done = false

    var body: some View {
        NavigationView {
            Form {
                TextField("Item Name", text: $name)
                Stepper(value: $quantity, in: 1...100) {
                    Text("Quantity: \(quantity)")
                }
                TextField("Brand", text: $brand)
                Picker("Urgency", selection: $urgency) {
                    ForEach(["Low", "Medium", "High"], id: \.self) { urgency in
                        Text(urgency)
                    }
                }
                Toggle(isOn: $done) {
                    Text("Done")
                }
            }
            .navigationBarTitle("Add Item", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                isPresented.toggle()
            }, trailing: Button("Add") {
                let newItem = ShoppingListItem(name: name, quantity: quantity, brand: brand, urgency: urgency, done: done)
                viewModel.addItem(item: newItem)
                isPresented.toggle()
            })
        }
    }
}
