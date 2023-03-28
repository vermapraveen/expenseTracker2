//
//  AddStoreView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import SwiftUI

struct AddStoreView: View {
    @ObservedObject var viewModel: StoreViewModel
    @Binding var isPresented: Bool
    @State private var name = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
            }
            .navigationBarTitle("Add Store")
            .navigationBarItems(leading: Button("Cancel", action: {
                isPresented = false
            }), trailing: Button("Add", action: {
                viewModel.addStore(name: name)
                isPresented = false
            }))
        }
    }
}

