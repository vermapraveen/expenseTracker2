//
//  AddPaymentTypeView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import SwiftUI

struct AddPaymentTypeView: View {
    @ObservedObject var viewModel: PaymentTypeViewModel
    @Binding var isPresented: Bool
    @State private var name = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
            }
            .navigationBarTitle("Add PaymentType")
            .navigationBarItems(leading: Button("Cancel", action: {
                isPresented = false
            }), trailing: Button("Add", action: {
                viewModel.addPaymentType(name: name)
                isPresented = false
            }))
        }
    }
}

