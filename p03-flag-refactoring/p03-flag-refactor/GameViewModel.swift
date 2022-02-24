//
//  GameViewModel.swift
//  p03-flag-refactor
//
//  Created by Samuel Shi on 1/17/22.
//

import Foundation

//#warning("Add GameViewModel class in this file")

class GameViewModel: ObservableObject {
    @Published var countries = CountryList.countries.shuffled().prefix(3)
    @Published var correctAnswerIndex = Int.random(in: 0...2)
    @Published var score = 0

    @Published var showingAlert = false
    @Published var alertTitle = ""
    
    var targetCountry: Country {
        return countries[correctAnswerIndex]
    }
    
    func checkGuess(country: Country) {
        if country == self.targetCountry {
            self.alertTitle = "Correct"
            self.score += 1
        } else {
            self.alertTitle = "Wrong! Thats the flag of \(country.name)"
        }
        self.showingAlert = true
    }
    
    func shuffle() {
        self.countries = CountryList.countries.shuffled().prefix(3)
        self.correctAnswerIndex = Int.random(in: 0...2)
    }
    
}
