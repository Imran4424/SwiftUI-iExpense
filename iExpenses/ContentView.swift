//
//  ContentView.swift
//  iExpenses
//
//  Created by Shah Md Imran Hossain on 12/4/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpenses = false
    
    var body: some View {
        NavigationView {
            List {
                // here id is not required anymore cause the struct conforms to Identifiable protocol
//                ForEach(expenses.items, id: \.id) { item in
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpenses")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    showingAddExpenses = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddExpenses) {
            AddView(expenses: expenses)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - Functions
extension ContentView {
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}
