//
//  NewPostView.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 2/17/22.
//

import SwiftUI

struct NewPostView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @StateObject var vm = NewPostViewModel()
    

    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $vm.currentText)

                    if vm.currentText.isEmpty {
                        Text("What's happening?")
                            .foregroundColor(.secondary)
                            .padding(8)
                    }
                }
            }
            .cornerRadius(10)
            .padding()
            .navigationTitle("Create Post")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        vm.makePost()
                        self.presentationMode.wrappedValue.dismiss()

                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)


    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView().bothColorSchemes()
    }
}


