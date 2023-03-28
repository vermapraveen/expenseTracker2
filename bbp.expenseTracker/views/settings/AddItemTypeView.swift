//
//  AddItemTypeView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import SwiftUI

struct AddItemTypeView: View {
    @ObservedObject var viewModel: ItemTypeViewModel
    @Binding var isPresented: Bool
    @State private var name = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
            }
            .navigationBarTitle("Add ItemType")
            .navigationBarItems(leading: Button("Cancel", action: {
                isPresented = false
            }), trailing: Button("Add", action: {
                viewModel.addItemType(name: name)
                isPresented = false
            }))
        }
    }
}

