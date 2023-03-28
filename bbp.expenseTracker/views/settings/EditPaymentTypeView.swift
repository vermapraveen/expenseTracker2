//
//  EditPaymentTypeView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import SwiftUI

struct EditPaymentTypeView: View {
    @ObservedObject var viewModel: PaymentTypeViewModel
    @Binding var isPresented: Bool
    @State private var name: String
    private let PaymentType: PaymentType
    
    init(viewModel: PaymentTypeViewModel, PaymentType: PaymentType, isPresented: Binding<Bool>) {
        self.viewModel = viewModel
        self.PaymentType = PaymentType
        _name = State(initialValue: PaymentType.name)
        _isPresented = isPresented
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
            }
            .navigationBarTitle("Edit PaymentType")
            .navigationBarItems(leading: Button("Cancel", action: {
                isPresented = false
            }), trailing: Button("Save", action: {
                viewModel.updatePaymentType(PaymentType: PaymentType, newName: name)
                isPresented = false
            }))
        }
    }
}
