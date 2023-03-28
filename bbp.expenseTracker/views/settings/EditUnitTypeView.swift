//
//  EditUnitTypeView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import SwiftUI

struct EditUnitTypeView: View {
    @ObservedObject var viewModel: UnitTypeViewModel
    @Binding var isPresented: Bool
    @State private var name: String
    private let UnitType: UnitType
    
    init(viewModel: UnitTypeViewModel, UnitType: UnitType, isPresented: Binding<Bool>) {
        self.viewModel = viewModel
        self.UnitType = UnitType
        _name = State(initialValue: UnitType.name)
        _isPresented = isPresented
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
            }
            .navigationBarTitle("Edit UnitType")
            .navigationBarItems(leading: Button("Cancel", action: {
                isPresented = false
            }), trailing: Button("Save", action: {
                viewModel.updateUnitType(UnitType: UnitType, newName: name)
                isPresented = false
            }))
        }
    }
}
