//
//  SettingsView.swift
//  TheMovieApp
//
//  Created by Burak Öztopuz on 30.08.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var selection = 1
    @State private var email = ""
    @Binding var isPresented : Bool
    
    var body: some View {
        NavigationView{
            Form{
                Picker(selection: $selection,label: Text("Favorite Genre")) {
                    Text("Action").tag(1)
                    Text("Comedy").tag(2)
                    Text("Horror").tag(3)
                    Text("Scify").tag(4)
                    
                }
                
                Section(header: Text("Email")) {
                    TextField("Email", text: $email)
                        
                }
                Button {
                    isPresented.toggle()
                } label: {
                    Text("Save")
                }
                
                
                
            }.navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isPresented: Binding<Bool>.constant(false))
    }
}
