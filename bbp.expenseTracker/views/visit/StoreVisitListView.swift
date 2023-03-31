//
//  StoreVisitListView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/30/23.
//

import SwiftUI

struct StoreVisitListView: View {
    @ObservedObject var storeVisitViewModel = StoreVisitViewModel()
    @Binding var selectedVisitId: UUID?
    var onVisitItemSelected: (UUID) -> Void

    var body: some View {
        List {
            ForEach(storeVisitViewModel.storeVisits) { visit in
                VStack(alignment: .leading, spacing: 2) {
                    Text(visit.storeName)
                        .font(.headline)

                    Text("Visitors: \(visit.visitors.map { $0.name }.joined(separator: ", "))")
                        .font(.footnote)

                    Text("Payment Amount: \(visit.paymentAmount, specifier: "%.2f")")
                        .font(.footnote)

                    Text("Payment Method: \(visit.paymentMethod)")
                        .font(.footnote)

                    Text("Check-In Date: \(visit.checkInDate, formatter: DateFormatter.dateOnly)")
                        .font(.footnote)

                    Text("Check-In Time: \(visit.checkInTime, formatter: DateFormatter.timeOnly)")
                        .font(.footnote)
                }
                .padding(.vertical)
                .onTapGesture {
                    onVisitItemSelected(visit.id)
                }
            }
        }
    }
}

extension DateFormatter {
    static var dateOnly: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }

    static var timeOnly: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }
}

