//
//  EditStoreView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import SwiftUI

struct EditStoreView: View {
    @ObservedObject var viewModel: StoreViewModel
    @Binding var isPresented: Bool
    @State private var name: String
    private let Store: Store
    
    init(viewModel: StoreViewModel, Store: Store, isPresented: Binding<Bool>) {
        self.viewModel = viewModel
        self.Store = Store
        _name = State(initialValue: Store.name)
        _isPresented = isPresented
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
            }
            .navigationBarTitle("Edit Store")
            .navigationBarItems(leading: Button("Cancel", action: {
                isPresented = false
            }), trailing: Button("Save", action: {
                viewModel.updateStore(Store: Store, newName: name)
                isPresented = false
            }))
        }
    }
}
