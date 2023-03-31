//
//  visitService.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/30/23.
//

import Foundation
import Combine

class LastVisitAPI: ObservableObject {
    func fetchLastVisit(completion: @escaping (UUID?) -> Void) {
        let url = URL(string: "https://yourapiurl.com/api/last_visit")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let visit = try JSONDecoder().decode(StoreVisit.self, from: data)
                    completion(UUID())
                } catch {
                    print("Error decoding visit data:", error)
                    completion(UUID())
                }
            } else {
                print("Error fetching visit data:", error?.localizedDescription ?? "Unknown error")
                completion(UUID())
            }
        }.resume()
    }
}


