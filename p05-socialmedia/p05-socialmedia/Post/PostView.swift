//
//  PostView.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 1/31/22.
//

import SwiftUI

struct PostView: View {
    @State var post: Post
    @State var liked: Bool = false
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Image(post.authorImageAddress)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(post.authorName)
                    Text(post.authorUsername)
                        .foregroundColor(.secondary)
                        .font(.callout)
                }
                Spacer()
                Text(post.formattedDate)
                    .foregroundColor(.secondary)
                    .font(.callout)
            }
            
            Text(post.postContent)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Button(action: {if liked {
                    post.likeCount -= 1
                }
                    else {
                        post.likeCount += 1
                    }
                    liked.toggle()
                }){
                    Label("\(post.likeCount)", systemImage: liked ? "heart.fill": "heart")
                    
                        .foregroundColor(liked ? .red: .primary)
                }
                
//                TODO post navigation to comment screen
                Button(action: {}){
                    Label(  "\(post.commentCount)",
                        systemImage: "message")
                    }.foregroundColor(.primary)
//                TODO
                
                Spacer()
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: .example)
            .bothColorSchemes()
    }
}
