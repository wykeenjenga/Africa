//
//  ContentView.swift
//  Africa
//
//  Created by Wykee Njenga on 3/29/22.
//

import SwiftUI

struct ContentView: View {
    
    //properties
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    //body
    var body: some View {
        
        
        NavigationView{
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0,
                                              bottom: 0, trailing: 0))
                
                ForEach(animals){ animal in
                    NavigationLink(destination: AnimalDetaileView(animal: animal)) {
                        
                        AnimalListItemView(animal: animal)
                    
                    }
                    
                }
                
            }//list
            
            .navigationBarTitle("Welcome to Africa", displayMode: .large)
            
        }//navigation
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
