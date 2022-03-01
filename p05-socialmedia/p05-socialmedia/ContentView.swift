//
//  ContentView.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 1/31/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeFeedView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            NewPostView()
                .tabItem {
                    Label("New Post", systemImage: "plus.circle")
                }
            
//            Text("Profile")
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().bothColorSchemes()
    }
}
