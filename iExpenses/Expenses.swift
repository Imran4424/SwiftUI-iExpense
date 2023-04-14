//
//  Expenses.swift
//  iExpenses
//
//  Created by Shah Md Imran Hossain on 12/4/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            guard let encoded = try? JSONEncoder().encode(items) else {
                print("Json coder Encoding failed")
                return
            }
            
            UserDefaults.standard.set(encoded, forKey: "Items")
        }
    }
    
    init() {
        guard let savedItems = UserDefaults.standard.data(forKey: "Items") else {
            print("Item not saved")
            items = []
            return
        }
        
        guard let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) else {
            print("Item decoding failed")
            items = []
            return
        }
        
        items = decodedItems
    }
}
