//
//  AddUnitTypeView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import SwiftUI

struct AddUnitTypeView: View {
    @ObservedObject var viewModel: UnitTypeViewModel
    @Binding var isPresented: Bool
    @State private var name = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
            }
            .navigationBarTitle("Add UnitType")
            .navigationBarItems(leading: Button("Cancel", action: {
                isPresented = false
            }), trailing: Button("Add", action: {
                viewModel.addUnitType(name: name)
                isPresented = false
            }))
        }
    }
}

