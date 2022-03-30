//
//  CoverImageView.swift
//  Africa
//
//  Created by Wykee Njenga on 3/29/22.
//

import SwiftUI

struct CoverImageView: View {
    //Properties
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    //Body
    var body: some View {
        
        TabView {

            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                .scaledToFill()
                
            }//end of loop
            
        }//tabview
        .tabViewStyle(PageTabViewStyle())
    }
}

//preview
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
