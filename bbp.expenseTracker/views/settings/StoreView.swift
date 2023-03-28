//
//  StoreView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import SwiftUI

struct StoreView: View {
    @StateObject var viewModel = StoreViewModel()
    @State private var isAddingItem = false
    @State private var selectedItem: Store?

    private var isEditingItem: Binding<Bool> {
        Binding<Bool>(
            get: { selectedItem != nil },
            set: { if !$0 { selectedItem = nil } }
        )
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.Stores) { Store in
                    Text(Store.name)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                viewModel.removeStore(Store: Store)
                            } label: {
                                Label("Remove", systemImage: "trash")
                            }
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                            Button {
                                selectedItem = Store
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                        }
                }
            }
            .navigationBarTitle("Stores")
            .navigationBarItems(trailing: Button(action: {
                isAddingItem.toggle()
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $isAddingItem) {
                AddStoreView(viewModel: viewModel, isPresented: $isAddingItem)
            }
            .sheet(isPresented: isEditingItem) {
                if let selectedItem = selectedItem {
                    EditStoreView(viewModel: viewModel, Store: selectedItem, isPresented: isEditingItem)
                }
            }
        }
    }
}

