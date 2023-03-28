//
//  EditItemView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/25/23.
//

import SwiftUI

struct EditItemView: View {
    @ObservedObject var viewModel: ShoppingListViewModel
    @State var item: ShoppingListItem
    @Binding var isPresented: Bool

    var body: some View {
        NavigationView {
            Form {
                TextField("Item Name", text: $item.name)
                Stepper(value: $item.quantity, in: 1...100) {
                    Text("Quantity: \(item.quantity)")
                }
                TextField("Brand", text: $item.brand)
                Picker("Urgency", selection: $item.urgency) {
                    ForEach(["Low", "Medium", "High"], id: \.self) { urgency in
                        Text(urgency)
                    }
                }
                Toggle(isOn: $item.done) {
                    Text("Done")
                }
            }
            .navigationBarTitle("Edit Item", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                isPresented.toggle()
            }, trailing: Button("Save") {
                viewModel.updateItem(item: item)
                isPresented.toggle()
            })
        }
    }
}
