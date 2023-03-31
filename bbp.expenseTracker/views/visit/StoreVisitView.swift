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
    @State private var showAddExpenseItemView = false

    @StateObject var paymentTypeViewModel = PaymentTypeViewModel()
    @State private var selectedPaymentType1: PaymentType?
    @State private var selectedPaymentType2: PaymentType?
    @State private var amount1: String = ""
    @State private var amount2: String = ""
    @State private var showAddPaymentTypeView = false
    
    @State private var visitId: UUID?
    @State private var checkInDisabled = false
    @State private var showingPastVisits = false
    @ObservedObject var storeVisitViewModel = StoreVisitViewModel()
    @Binding var selectedTab: Int
    @State private var selectedVisitId: UUID?

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
                Section(header: Text("")) {
                    // Visiter drop-down
                    MultiSelectPicker(label: "Select Visiters",
                                      options: visiterViewModel.visiters,
                                      selection: $selectedVisiters,
                                      labelForSelection: { visiter in visiter.name })
                }
                Section(header: Text("")) {
                    // Check-in and Check-out buttons
                    HStack {
                        Button(action: {
                            visitId = UUID()
                            checkInDisabled = true
                        }) {
                            Text("Check In")
                        }
                        .disabled(checkInDisabled)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        
                        Button("Check Out", action: {
                            // Handle check-out action
                        }).padding().background(Color.red).foregroundColor(.white).cornerRadius(8)
                    }
                }
                Section(header: Text("Payment Details")) {
                    Picker("Payment Type 1", selection: $selectedPaymentType1) {
                        ForEach(paymentTypeViewModel.paymentTypes) { paymentType in
                            Text(paymentType.name).tag(paymentType as PaymentType?)
                        }
                    }
                    TextField("Amount", text: $amount1)
                        .keyboardType(.decimalPad)

                    HStack {
                        VStack {
                            Text("Payment Type 2")
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Picker("", selection: $selectedPaymentType2) {
                                ForEach(paymentTypeViewModel.paymentTypes) { paymentType in
                                    Text(paymentType.name).tag(paymentType as PaymentType?)
                                }
                            }.pickerStyle(MenuPickerStyle())
                        }

                        Button(action: {
                            showAddPaymentTypeView.toggle()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.blue)
                                .imageScale(.large)
                        }.sheet(isPresented: $showAddPaymentTypeView) {
                            AddPaymentTypeView(viewModel: paymentTypeViewModel, isPresented: $showAddPaymentTypeView)
                        }
                    }
                    TextField("Amount", text: $amount2)
                        .keyboardType(.decimalPad)
                    
                }
                Section(header: Text("Past Visits")) {
                    StoreVisitListView(storeVisitViewModel: storeVisitViewModel,
                                       selectedVisitId: $selectedVisitId,
                                       onVisitItemSelected: { visitId in
                                           selectedVisitId = visitId
                                           selectedTab = 2
                                       })
                        .navigationTitle("Store Visits")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }.padding()
        }
    }
}

