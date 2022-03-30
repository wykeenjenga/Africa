//
//  AnimalDetaileView.swift
//  Africa
//
//  Created by Wykee Njenga on 3/30/22.
//

import SwiftUI

struct AnimalDetaileView: View {
    //property
    
    let animal: Animal
    
    
    //body
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 20){
                
                //hero image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                
                //title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                
                //healine
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                
                //gallery
                
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "this is the text example of the heading text")
                    
                    InsertGalleryview(animal: animal)
                    
                }.padding(.horizontal)
                
                
                
                //facts
                
                Group{
                    
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    
                    InsertfactView(animal: animal)
                    
                }.padding(.horizontal)
                
                
                //description
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                    
                }.padding(.horizontal)
                
                
                //map
                Group{
                    
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    
                    InsertMapView()
                    
                }
                .padding(.horizontal)
                
                
                
                //link
                
                Group{
                    
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    
                    ExternalWebLinkView(animal: animal)
                    
                }
                .padding(.horizontal)
                
                
            }//vstack
            
            .navigationBarTitle("Learn more about \(animal.name)", displayMode: .inline)
        }//scroll
        
    }
}

struct AnimalDetaileView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animal.json")
    
    static var previews: some View {
        
        NavigationView{
            AnimalDetaileView(animal: animals[0])
        }
    }
}
