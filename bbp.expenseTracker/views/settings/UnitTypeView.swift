//
//  UnitTypeView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import SwiftUI

struct UnitTypeView: View {
    @StateObject var viewModel = UnitTypeViewModel()
    @State private var isAddingItem = false
    @State private var selectedItem: UnitType?

    private var isEditingItem: Binding<Bool> {
        Binding<Bool>(
            get: { selectedItem != nil },
            set: { if !$0 { selectedItem = nil } }
        )
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.UnitTypes) { UnitType in
                    Text(UnitType.name)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                viewModel.removeUnitType(UnitType: UnitType)
                            } label: {
                                Label("Remove", systemImage: "trash")
                            }
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                            Button {
                                selectedItem = UnitType
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                        }
                }
            }
            .navigationBarTitle("UnitTypes")
            .navigationBarItems(trailing: Button(action: {
                isAddingItem.toggle()
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $isAddingItem) {
                AddUnitTypeView(viewModel: viewModel, isPresented: $isAddingItem)
            }
            .sheet(isPresented: isEditingItem) {
                if let selectedItem = selectedItem {
                    EditUnitTypeView(viewModel: viewModel, UnitType: selectedItem, isPresented: isEditingItem)
                }
            }
        }
    }
}

