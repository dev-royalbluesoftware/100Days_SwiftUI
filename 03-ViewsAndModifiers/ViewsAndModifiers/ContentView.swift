//
//
// ViewsAndModifiers
// ContentView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

// MARK: - CapsuleText Properties

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
//            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}


struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "Hello, World!")
                .foregroundStyle(.white)
            
            CapsuleText(text: "SwiftUI")
                .foregroundStyle(.yellow)
        }
    }
}

#Preview {
    ContentView()
}
