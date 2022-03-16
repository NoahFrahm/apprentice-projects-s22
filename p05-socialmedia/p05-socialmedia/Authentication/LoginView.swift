//
//  LoginView.swift
//  p05-socialmedia
//
//  Created by Noah Frahm on 3/16/22.
//

import SwiftUI

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var badUserPass: Bool {
        if username.isEmpty || password.isEmpty {
            return true
        }
        return false
    }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(.blue)
                .frame(width: 300, height: 450)
            
            VStack(alignment: .center,spacing: 40){
                
                Spacer()
                
                Text("BlueBird")
                    .font(.title)
                    .foregroundColor(.white)
                
                userInfoFieldView(defaultText: "Username", info: $username)
//                    .padding([.bottom], 30)
                
                userInfoFieldView(defaultText: "PassWord", info: $password)
//                    .padding([.bottom], 30)
                
                
                Button(action: {
                    print("Done")
                }) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(.yellow)
                        Text("Login")
                            .font(.title2)
                    }.frame(width: 150, height: 50)
                }.disabled(badUserPass)
                
                Spacer()
                
            }.frame(width: 300, height: 450)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct userInfoFieldView: View {
    
    let defaultText: String
    let background: Color = .white

    @Binding var info: String
    
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(background)
            TextField(defaultText, text: $info)
                .font(.title2)
                .background(background)
                .padding()
        }.frame(width: 250, height: 50)
    }
}
