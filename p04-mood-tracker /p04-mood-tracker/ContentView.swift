//
//  ContentView.swift
//  p04-mood-tracker
//
//  Created by Samuel Shi on 1/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var mood = MoodCheckIn(mood: "")
    @StateObject private var moodModel = MoodTrackerViewModel()
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    HStack{
                        TextField("How are you feeling?", text: $mood.mood)
                        Button(action: {moodModel.checkIn(info: mood)
                            mood = MoodCheckIn(mood: "")
                        }) {
                                Text("Save")
                            }.tint(.blue)
                    }
                } header: {
                    Text("New Check-In")
                    .font(.subheadline)
                }
                
                Section{
                    if moodModel.checkIns.count == 0 {
                        Text("No previous check-ins yet...")
                            .foregroundColor(.gray)
                    }
                    else {
                        ForEach(moodModel.checkIns.reversed()) { check in
                            HStack{
                                VStack(alignment: .leading){
                                    Text("\(check.mood)")
                                        .font(.title3)
                                        .fontWeight(.medium)
                                    Text(check.formattedDate)
                                        .font(.caption)
                                        .fontWeight(.light)
                                }
                                
                            }
                            
                        }
                        
                    }
                } header: {
                    Text("Previous Check-Ins")
                    .font(.subheadline)
                }
                
            }.navigationTitle("Mood Tracker")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
