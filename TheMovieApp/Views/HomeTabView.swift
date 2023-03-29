//
//  HomeTabView.swift
//  TheMovieApp
//
//  Created by Burak Öztopuz on 29.08.2022.
//

import SwiftUI

struct HomeTabView: View {
    
    enum Tabs : Int {
        case movies
        case discover
    }
    
    @State private var selectedTab = Tabs.movies
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MoviesView().tabItem {
                tabBarItem(text: "Movies", image: "film")
            }.tag(Tabs.movies)
            DiscoverView().tabItem {
                tabBarItem(text: "Discover", image: "square.stack")
            }.tag(Tabs.movies)
        }
    }
    
    private func tabBarItem(text : String, image : String) -> some View {
        VStack{
            Image(systemName: image)
                .imageScale(.medium)
            Text(text)
        }
        
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
