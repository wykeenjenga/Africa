//
//  VideoListView.swift
//  Africa
//
//  Created by Wykee Njenga on 3/29/22.
//

import SwiftUI

struct VideoListView: View {
    
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    let hepticImpact = UIImpactFeedbackGenerator(style: .medium)// ripple on the button
    
    
    var body: some View {
        
        NavigationView {
            
            List {
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name )) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
                }
            }//list
            
            .listStyle(InsetGroupedListStyle())
            
            .navigationBarTitle("Videos", displayMode: .inline)
            
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        //shuffel videos
                        
                        videos.shuffle()
                        hepticImpact.impactOccurred()
                        
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    }
                    
                }
            }//toolbar
            
        }//end of navigation
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
