//
//  ContentView.swift
//  TheMovieApp
//
//  Created by Burak Öztopuz on 29.08.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSettings = false
    
    var body: some View {
        NavigationView{
            Group{
                HomeTabView()
            }.navigationBarTitle(Text("Movies"), displayMode: .automatic)
                .navigationBarItems(trailing: HStack{
                    settingsView
                })
                .sheet(isPresented: $showSettings) {
                    SettingsView(isPresented: $showSettings)
                }
        }
    }
    
    private var settingsView : some View {
        Button {
            showSettings.toggle()
        } label: {
            HStack {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .foregroundColor(.gray)
                .frame(width: 30, height: 30)
                Text("Settings")
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
