//
//  ItemTypeView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import SwiftUI

struct ItemTypeView: View {
    @StateObject var viewModel = ItemTypeViewModel()
    @State private var isAddingItem = false
    @State private var selectedItem: ItemType?

    private var isEditingItem: Binding<Bool> {
        Binding<Bool>(
            get: { selectedItem != nil },
            set: { if !$0 { selectedItem = nil } }
        )
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.ItemTypes) { ItemType in
                    Text(ItemType.name)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                viewModel.removeItemType(ItemType: ItemType)
                            } label: {
                                Label("Remove", systemImage: "trash")
                            }
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                            Button {
                                selectedItem = ItemType
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                        }
                }
            }
            .navigationBarTitle("ItemTypes")
            .navigationBarItems(trailing: Button(action: {
                isAddingItem.toggle()
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $isAddingItem) {
                AddItemTypeView(viewModel: viewModel, isPresented: $isAddingItem)
            }
            .sheet(isPresented: isEditingItem) {
                if let selectedItem = selectedItem {
                    EditItemTypeView(viewModel: viewModel, ItemType: selectedItem, isPresented: isEditingItem)
                }
            }
        }
    }
}

