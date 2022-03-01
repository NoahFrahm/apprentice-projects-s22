//
//  ProfileView.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 2/2/22.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var vm = HomeFeedViewModel()
    @State private var editProfile: Bool = false


    let name: String = "App Team Carolina"
    let username: String = "appteamcarolina"
    let profileImageAddress: String = "appteam" // will eventually be url
    
    let userPosts: [Post] = PostList.defaultPosts

    var body: some View {
        NavigationView{
           
            VStack{
                NavigationLink(destination: ProfileSettings(), isActive: $editProfile) {
                    EmptyView()
                }
                ProfileInfoView(editProfile: $editProfile, profileImageAddress: profileImageAddress, name: name, username: username)
            
                ScrollView {
                    ForEach(vm.posts) { post in
                        PostView(post: post)
                            .padding([.top, .bottom], 10)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("bluebird")
                .padding([.leading, .trailing], 10)
                
            }.padding()
                .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ProfileInfoView: View {
    
    @Binding var editProfile: Bool
    
    let profileImageAddress: String
    let name: String
    let username: String
    
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Image(profileImageAddress)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    
                    Text(name)
                        .bold()
                    Text("@\(username)")
                        .foregroundColor(.secondary)
                }
                Spacer()
                Button(action: {editProfile.toggle()}) {
                    Text("Fix Up Profile")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.primary)
                        .background(.white)
                        .padding([.top, .bottom], 10)
                        .padding([.trailing, .leading])
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(.black, lineWidth: 2))
                }
            }
            HStack{
                Text("1")
                    .bold()
                Text("Following")
                    .fontWeight(.regular)
                
                Text("3.6K")
                    .bold()
                Text("Followers")
                    .fontWeight(.regular)
                Spacer()
            }.padding([.top], 5)
                .padding([.bottom], 10)
            
            
            HStack{
                Text("Tweets")
                    .bold()
                Spacer()
                Text("Tweets")
                    .bold()
                Spacer()
                Text("Tweets")
                    .bold()
                Spacer()
                Text("Tweets")
                    .bold()
                
            }.padding([.top, .bottom], 5)
            Divider()
        }
    }
}
    

