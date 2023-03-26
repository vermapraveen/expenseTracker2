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
    @State private var isEditingItem = false
    @State private var selectedItem: ShoppingListItem?

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
                                isEditingItem = true
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
            .sheet(isPresented: $isEditingItem, onDismiss: {
                selectedItem = nil
            }) {
                if selectedItem == nil {
                    EmptyView()
                } else {
                    EditItemView(viewModel: viewModel, item: selectedItem!, isPresented: $isEditingItem)
                }
            }
        }
    }
}
