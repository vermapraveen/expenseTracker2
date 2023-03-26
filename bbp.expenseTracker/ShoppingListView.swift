//
//  ShoppingListView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/25/23.
//

import SwiftUI

struct ShoppingListView: View {
    @StateObject var viewModel = ShoppingListViewModel()
    @State private var isAddingItem = false
    @State private var selectedItem: ShoppingListItem?

    private var isEditingItem: Binding<Bool> {
        Binding<Bool>(
            get: { selectedItem != nil },
            set: { if !$0 { selectedItem = nil } }
        )
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.items) { item in
                    ShoppingListItemView(viewModel: viewModel, item: item)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                viewModel.removeItem(item: item)
                            } label: {
                                Label("Remove", systemImage: "trash")
                            }
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                            Button {
                                selectedItem = item
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                        }
                }
            }
            .navigationBarTitle("Shopping List")
            .navigationBarItems(trailing: Button(action: {
                isAddingItem.toggle()
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $isAddingItem) {
                AddItemView(viewModel: viewModel, isPresented: $isAddingItem)
            }
            .sheet(isPresented: isEditingItem) {
                if let selectedItem = selectedItem {
                    EditItemView(viewModel: viewModel, item: selectedItem, isPresented: isEditingItem)
                }
            }
        }
    }
}

