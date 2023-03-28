//
//  StoreVisitView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/27/23.
//

import SwiftUI

struct StoreVisitView: View {
    @ObservedObject var storeViewModel: StoreViewModel
    @ObservedObject var visiterViewModel: VisiterViewModel
    @ObservedObject var expenseItemViewModel = ExpenseItemViewModel()
    @State private var selectedStore: Store?
    @State private var selectedVisiters: Set<Visiter> = []
    @State private var showAddStoreView = false

    var body: some View {
        NavigationView {
            VStack {
                // Store drop-down
                Section(header: Text("Store")) {
                    HStack {
                        Picker("Select Store", selection: $selectedStore) {
                            ForEach(storeViewModel.Stores) { store in
                                Text(store.name).tag(store as Store?)
                            }
                        }.pickerStyle(MenuPickerStyle())
                        
                        Button(action: {
                            showAddStoreView.toggle()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.blue)
                                .imageScale(.large)
                        }.sheet(isPresented: $showAddStoreView) {
                            AddStoreView(viewModel: storeViewModel, isPresented: $showAddStoreView)
                        }
                    }
                }

                // Visiter drop-down
                MultiSelectPicker(label: "Select Visiters",
                                  options: visiterViewModel.visiters,
                                  selection: $selectedVisiters,
                                  labelForSelection: { visiter in visiter.name })


                // Check-in and Check-out buttons
                HStack {
                    Button("Check In", action: {
                        // Handle check-in action
                    }).padding().background(Color.blue).foregroundColor(.white).cornerRadius(8)

                    Button("Check Out", action: {
                        // Handle check-out action
                    }).padding().background(Color.red).foregroundColor(.white).cornerRadius(8)
                }

                // ExpenseItem list
                List {
                    ForEach(expenseItemViewModel.expenseItems) { expenseItem in
                        // Display ExpenseItem, handle edit and remove
                    }
                }
            }.padding()
            .navigationBarTitle("Store Visit")
        }
    }
}

