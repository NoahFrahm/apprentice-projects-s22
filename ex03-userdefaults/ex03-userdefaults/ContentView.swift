//
//  ContentView.swift
//  ex03-userdefaults
//
//  Created by Samuel Shi on 3/1/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()

    var body: some View {
        NavigationView {
            VStack {
                GroupBox("Number of People") {
                    Stepper("\(vm.numberOfPeople) people", value: $vm.numberOfPeople, in: 0 ... 100)
                }

                GroupBox("Distance from Home (mi)") {
                    HStack {
                        Text("\(vm.distanceFromHome, specifier: "%.2f") mi")
                        Slider(value: $vm.distanceFromHome, in: 0 ... 10)
                    }
                }

                GroupBox("Name") {
                    TextField("Sam", text: $vm.name)
                        .textFieldStyle(.roundedBorder)
                }

                GroupBox("User Details") {
                    VStack {
                        TextField("Name", text: $vm.user.name)
                        TextField("Username", text: $vm.user.username).textInputAutocapitalization(.never)
                    }
                    .textFieldStyle(.roundedBorder)
                }
                
                if vm.unsavedChanges {
                    Text("⚠️ Unsaved Changes")
                }

                Spacer()

                Button(action: {
                    vm.save()
                }, label: {
                    Text("Save")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            }
            .padding()
            .navigationTitle("defaultey")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") { vm.save() }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
