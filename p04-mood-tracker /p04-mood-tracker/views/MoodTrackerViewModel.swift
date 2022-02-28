//
//  MoodTrackerViewModel.swift
//  p04-mood-tracker
//
//  Created by Noah Frahm on 2/27/22.
//

import Foundation

class MoodTrackerViewModel: ObservableObject {
    @Published var checkIns: [MoodCheckIn] = []
    
    func checkIn(info: MoodCheckIn) {
        checkIns.append(info)
    }
}

