//
//  InsertGalleryview.swift
//  Africa
//
//  Created by Wykee Njenga on 3/30/22.
//

import SwiftUI

struct InsertGalleryview: View {
    
    let animal: Animal
    
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12.0)
                }//loop
            }//hstack
        }//scrollview
        
    }
}

struct InsertGalleryview_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsertGalleryview(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
