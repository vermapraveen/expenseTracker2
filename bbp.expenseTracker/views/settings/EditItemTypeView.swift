//
//  EditItemTypeView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import SwiftUI

struct EditItemTypeView: View {
    @ObservedObject var viewModel: ItemTypeViewModel
    @Binding var isPresented: Bool
    @State private var name: String
    private let ItemType: ItemType
    
    init(viewModel: ItemTypeViewModel, ItemType: ItemType, isPresented: Binding<Bool>) {
        self.viewModel = viewModel
        self.ItemType = ItemType
        _name = State(initialValue: ItemType.name)
        _isPresented = isPresented
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
            }
            .navigationBarTitle("Edit ItemType")
            .navigationBarItems(leading: Button("Cancel", action: {
                isPresented = false
            }), trailing: Button("Save", action: {
                viewModel.updateItemType(ItemType: ItemType, newName: name)
                isPresented = false
            }))
        }
    }
}
