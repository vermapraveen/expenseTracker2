//
//  PaymentTypeView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import SwiftUI

struct PaymentTypeView: View {
    @StateObject var viewModel = PaymentTypeViewModel()
    @State private var isAddingItem = false
    @State private var selectedItem: PaymentType?

    private var isEditingItem: Binding<Bool> {
        Binding<Bool>(
            get: { selectedItem != nil },
            set: { if !$0 { selectedItem = nil } }
        )
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.PaymentTypes) { PaymentType in
                    Text(PaymentType.name)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                viewModel.removePaymentType(PaymentType: PaymentType)
                            } label: {
                                Label("Remove", systemImage: "trash")
                            }
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                            Button {
                                selectedItem = PaymentType
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                        }
                }
            }
            .navigationBarTitle("PaymentTypes")
            .navigationBarItems(trailing: Button(action: {
                isAddingItem.toggle()
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $isAddingItem) {
                AddPaymentTypeView(viewModel: viewModel, isPresented: $isAddingItem)
            }
            .sheet(isPresented: isEditingItem) {
                if let selectedItem = selectedItem {
                    EditPaymentTypeView(viewModel: viewModel, PaymentType: selectedItem, isPresented: isEditingItem)
                }
            }
        }
    }
}

