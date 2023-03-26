//
//  EditVisiterView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import SwiftUI

struct EditVisiterView: View {
    @ObservedObject var viewModel: VisiterViewModel
    @Binding var isPresented: Bool
    @State private var name: String
    private let visiter: Visiter
    
    init(viewModel: VisiterViewModel, visiter: Visiter, isPresented: Binding<Bool>) {
        self.viewModel = viewModel
        self.visiter = visiter
        _name = State(initialValue: visiter.name)
        _isPresented = isPresented
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
            }
            .navigationBarTitle("Edit Visiter")
            .navigationBarItems(leading: Button("Cancel", action: {
                isPresented = false
            }), trailing: Button("Save", action: {
                viewModel.updateVisiter(visiter: visiter, newName: name)
                isPresented = false
            }))
        }
    }
}
