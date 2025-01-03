//
//
// WeSplit
// ContentView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct ContentView: View {
    
    // MARK: - State Properties
    
    @FocusState private var amountIsFocused: Bool
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    // MARK: - Properties
    
    let tipPercentages = [10, 15, 20, 25, 30]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = (checkAmount / 100) * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var checkGrandTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = (checkAmount / 100) * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var tipTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = (checkAmount / 100) * tipSelection
        
        return tipValue
    }
    
    // MARK: - ContentView Body
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Check Amount") {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("How much tip do you want to leave?") {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Tip Total") {
                    Text(tipTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Grand Total") {
                    Text(checkGrandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Total Per Person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                Button("Done") {
                    amountIsFocused = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
