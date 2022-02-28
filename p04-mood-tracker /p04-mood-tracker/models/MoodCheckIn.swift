//
//  MoodCheckIn.swift
//  p04-mood-tracker
//
//  Created by Noah Frahm on 2/27/22.
//

import Foundation


struct MoodCheckIn: Identifiable {
    let id = UUID()

    var mood: String
    var timeStamp: Date = Date.now
    
    var formattedDate: String {
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "MMMM d, yyyy, HH:mm a"
//        "HH:mm E, d MMM y"
//        "january 18, 2022, 12:04 AM"
        return formatter1.string(from: timeStamp)
        
    }
}
