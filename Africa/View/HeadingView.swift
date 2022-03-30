//
//  HeadingView.swift
//  Africa
//
//  Created by Wykee Njenga on 3/30/22.
//

import SwiftUI

struct HeadingView: View {
    //prop
    
    var headingImage: String
    var headingText: String
    
    //body
    var body: some View {
        
        HStack{
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "this an example of the text")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
