//
//  ContentView.swift
//  p02-apollo
//
//  Created by Samuel Shi on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    // use this array of missions to show your mission content
    let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {
        NavigationView{
            List{
                ForEach(missions){mission in
                    NavigationLink(destination: MissionsDetailView(mission: mission)){
                        HStack{
                            Image("apollo\(mission.id)")
                                .resizable()
                                .frame(width: 60, height: 60, alignment: .leading)
                            VStack(alignment: .leading){
                                Text("**\(mission.displayName)**")
                                mission.launchDate == nil ? Text("N/A").font(.subheadline): Text(mission.launchDate!, style: .date)
                                    .font(.subheadline)
                                }
                        }
                    }
                }
            }.navigationTitle("NASA Missions")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//- Navigation Bar Title with mission display name
//- Large `Image` with the correct image from `assets.xcassets`
//- `Text` with launch date
//- `Text` with long description
//- `ForEach` over the crew members array inside of the `Mission` struct. Each subview shows
//    - Crew Member’s `Image`
//    - Crew Member’s name in a `Text`

struct MissionsDetailView: View {
    
    var mission: Mission
    
    var body: some View {
        ScrollView{
            Image("apollo\(mission.id)")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
                .padding([.top, .bottom], 10)
            mission.launchDate == nil ? Text("N/A").font(.subheadline): Text(mission.launchDate!, style: .date)
                .font(.subheadline)
            Spacer()
            Text("\(mission.description)")
                .padding()
            VStack{
                ForEach(mission.crew, id: \.id){ member in
                    HStack{
                        Image("\(member.id)")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(5)
                            .frame(width: 100, height: 60, alignment: .leading)
                        Text("\(member.name)")
                        Spacer()

                    }.padding()
                }
            }
            
        }.navigationBarTitle("\(mission.displayName)")
        
    }
}
