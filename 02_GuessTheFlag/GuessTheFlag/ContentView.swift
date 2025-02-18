//
//
// GuessTheFlag
// ContentView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
//


import SwiftUI

struct ContentView: View {
    
    // MARK: - @State Properties
    
    @State private var showingScore = false
    @State private var showingFinalScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var wrongAnswers = 0
    @State private var questionCount = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Italy", "Ireland", "Nigeria", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0 ... 2)
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: .blue, location: 0.3),
                .init(color: .pink, location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0 ..< 3) { number in
                        Button {
                            flagTapped(number)
                            
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue") { askQuestion() }
            
        } message: {
            Text("Your score is: \(score)")
        }
        .alert("Game Over!", isPresented: $showingFinalScore) {
            Button("Start New Game") { resetGame() }
            
        } message: {
            Text("Final Score: \(score) correct\n\(wrongAnswers) wrong")
        }
    }
    
    // MARK: - Flag Tapped Function
    
    func flagTapped(_ number: Int) {
        questionCount += 1
        
        if number == correctAnswer {
            scoreTitle = "Correct!"
            score += 1
            
        } else {
            scoreTitle = "Wrong"
            wrongAnswers += 1
        }
        
        if questionCount == 10 {
            showingFinalScore = true
        }
        showingScore = true
    }
    
    // MARK: - Ask Question Function
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0 ... 2)
    }
    
    // MARK: - Add Reset Game Function
    
    func resetGame() {
        score = 0
        wrongAnswers = 0
        questionCount = 0
        showingFinalScore = false
        askQuestion()
    }
}

#Preview {
    ContentView()
}
