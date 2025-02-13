//
//
// WeSplit
// HackingCodeSamples.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
//


import SwiftUI

struct HackingCodeSamples: View {
    
    // MARK: - Properties
    
    @State private var tapCount = 0
    @State private var name = ""
    
    let students = ["Alice", "Bob", "Charlie"]
    @State private var selectedStudent = "Bob"
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    Button("Tap Count: \(tapCount)") {
                        tapCount += 1
                    }
                }
    
                Section {
                    // Binding State
                    TextField("Enter your name...", text: $name)
                    
                    Text("Your name is \(name)")
                }
                
                Section {
                    // Creating Loops - ForEach
                    ForEach(0..<10) {
                        Text("Row \($0 + 1)")
                    }
                }
                
                Section {
                    Picker("Select your Student", selection: $selectedStudent) {
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
            }
            .navigationTitle("WeSplit")
        }
    }
}

#Preview {
    HackingCodeSamples()
}
