//
//  SettingsView.swift
//  ex03-userdefaults
//
//  Created by Samuel Shi on 3/1/22.
//

import SwiftUI

struct Computer: Codable {
    let name: String
    let serialNumber: String
}

class SettingsViewModel: ObservableObject {
    @Published var prefersHighContrast = false
    @Published var name: String = ""
    
    @Published var computerName = ""
    @Published var computerSerialNumber = ""
    
    init() {
        prefersHighContrast = UserDefaults.standard.bool(forKey: "prefersHighContrast")
        name = UserDefaults.standard.string(forKey: "name") ?? ""
        
        guard let data = UserDefaults.standard.data(forKey: "computer1"),
              let computer = try? JSONDecoder().decode(Computer.self, from: data)
        else {
            print("🆘 failed to decode")
            return
        }
        
        self.computerName = computer.name
        self.computerSerialNumber = computer.serialNumber
    }
    
    func save() {
        UserDefaults.standard.set(prefersHighContrast, forKey: "prefersHighContrast")
        UserDefaults.standard.set(name, forKey: "name")
        
        guard let data = try? JSONEncoder().encode(Computer(name: computerName, serialNumber: computerSerialNumber)) else {
            print("🙋‍♂️ Failed to encode")
            return
        }
        
        UserDefaults.standard.set(data, forKey: "computer1")
    }
}

struct SettingsView: View {
    @StateObject var vm = SettingsViewModel()
    
    var body: some View {
        VStack {
            Text(vm.prefersHighContrast ? "High Contrast" : "Normal")
            
            Toggle(isOn: $vm.prefersHighContrast) {
                Text("High Contrast")
            }
            
            TextField("Computer Name", text: $vm.computerName)
            TextField("Computer Serial Number", text: $vm.computerSerialNumber)

            Button("Save", action: vm.save)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
