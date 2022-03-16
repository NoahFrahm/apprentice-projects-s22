//
//  SignUpView.swift
//  p05-socialmedia
//
//  Created by Noah Frahm on 3/16/22.
//

import SwiftUI

struct SignUpView: View {
    
    @State var username: String = ""
    @State var name: String = ""
    @State var password: String = ""
    @State var confirmPass: String = ""
    
    var badUserPass: Bool {
        if username.isEmpty || password.isEmpty || confirmPass.isEmpty || password != confirmPass || name.isEmpty {
            return true
        }
        return false
    }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(.blue)
                .frame(width: 300, height: 600)
            
            VStack(alignment: .center,spacing: 40){
                
                Spacer()
                
                Text("BlueBird")
                    .font(.title)
                    .foregroundColor(.white)
                
                userInfoFieldView(defaultText: "Username", info: $username)
                
                userInfoFieldView(defaultText: "Name", info: $name)
                
                userInfoFieldView(defaultText: "PassWord", info: $password)
                
                userInfoFieldView(defaultText: "Confirm passWord", info: $confirmPass)
                
                
                Button(action: {
                    print("Done")
                }) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(.yellow)
                        Text("Sign up")
                            .font(.title2)
                    }.frame(width: 150, height: 50)
                }.disabled(badUserPass)
                
                Spacer()
                
            }.frame(width: 300, height: 600)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
