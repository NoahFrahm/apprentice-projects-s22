//
//  ViewModel.swift
//  ex03-userdefaults
//
//  Created by Samuel Shi on 3/1/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var numberOfPeople: Int = 0 { didSet { setNewChanges() } }
    @Published var distanceFromHome: Double = 0.0 { didSet { setNewChanges() } }
    @Published var name: String = "" { didSet { setNewChanges() } }
    @Published var user: User = .init() { didSet { setNewChanges() } }
    @Published var unsavedChanges = false
    
    let userDefaults = UserDefaults.standard
    
    init() {
        // MARK: fetch from UserDefaults
        
        // this should stay at the bottom of this function
        self.unsavedChanges = false
    }
    
    func save() {
        // MARK: Save to UserDefaults
        
        // this should stay at the bottom of this function
        unsavedChanges = false
    }
    
    func setNewChanges() {
        unsavedChanges = true
    }
}
