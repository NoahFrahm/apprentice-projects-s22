//
//  HomeFeedView.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 2/1/22.
//

import SwiftUI

struct HomeFeedView: View {
    @StateObject var vm = HomeFeedViewModel()
    @State private var posting: Bool = false

    var body: some View {
        NavigationView {
            ZStack{
                ScrollView {
                    ForEach(vm.posts) { post in
                        PostView(post: post)
                            .padding([.top, .bottom], 10)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("bluebird")
                .padding([.leading, .trailing], 10)
                
                PostButtonView(posting: $posting)
                
            }
            
        }
        .onAppear(perform: {
            vm.fetchPosts()
        })
    }
}

struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView().bothColorSchemes()
    }
}

struct PostButtonView: View {
    
    @Binding var posting: Bool
    
    var body: some View {
//        NavigationView{
        VStack{
            Spacer()
            HStack(){
                Spacer()
                NavigationLink(destination: NewPostView()) {
                    ZStack {
                        Circle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.blue)
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    
                }
                
            }.padding()
        }
    }
}
