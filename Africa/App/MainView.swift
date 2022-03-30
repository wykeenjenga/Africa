//
//  MainView.swift
//  Africa
//
//  Created by Wykee Njenga on 3/29/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        //tabview
        TabView{
    
            ContentView()
                .tabItem{
    
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
            }
            
            VideoListView()
                .tabItem{
                    
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                    
                }
            
            MapView()
                .tabItem{
                    
                    Image(systemName: "map")
                    Text("Locations")
                    
                }
            
            GalleryView()
                .tabItem{
                    
                    Image(systemName: "photo")
                    Text("Gallery")
                    
                }
            
        }//tabview
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
