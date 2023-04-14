//
//  ExpenseItem.swift
//  iExpenses
//
//  Created by Shah Md Imran Hossain on 12/4/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
