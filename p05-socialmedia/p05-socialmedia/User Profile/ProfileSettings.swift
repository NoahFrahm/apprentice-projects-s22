//
//  ProfileSettings.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 2/2/22.
//

import SwiftUI

struct ProfileSettings: View {
    var body: some View {
        
        VStack{
//            Spacer()
            VStack(alignment: .center){
//                Spacer()
                Image("appteam")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                HStack(alignment: .center){
                    Text("Edit Profile Picture")
                        .foregroundColor(.blue)
                }.padding([.top, .bottom], 30)
                
            }.padding([.top], 20)
            
            Divider()
            ProfileFieldView(title: "Name", current: "AppTeam", spacerVal: 70)
            ProfileFieldView(title: "Username", current: "AppTeamCarolina", spacerVal: 35)
            ProfileFieldView(title: "Pronouns", current: "They/Them", spacerVal: 40)
            EndFieldView(title: "Bio", current: "we code", spacerVal: 88)
            Divider()
            
//            Spacer()
            Button(action: {}) {
                Text("Delete Account")
                    .font(.subheadline)
                    .bold()
//                    .foregroundColor(.red)
                    .foregroundColor(.primary)
                    .background(.white)
                    .padding([.top, .bottom], 10)
                    .padding([.trailing, .leading])
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(.red, lineWidth: 2))
            }.padding([.top, .bottom], 50)
            Spacer()
        }.padding()
    }
    
}

struct ProfileSettings_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettings()
    }
}

struct ProfileFieldView: View {
    
    var title: String
    var current: String
    var spacerVal: Double
    
    var body: some View {
        HStack(alignment: .firstTextBaseline){
            Text(title)
            Spacer()
                .frame(width: spacerVal)
            VStack(alignment: .leading){

                Text(current)
                Divider()
            }
        }
    }
}

struct EndFieldView: View {
    
    var title: String
    var current: String
    var spacerVal: Double
    
    var body: some View {
        HStack(){
            Text(title)
            Spacer()
                .frame(width: spacerVal)
            Text(current)
            Spacer()
        }
    }
}
