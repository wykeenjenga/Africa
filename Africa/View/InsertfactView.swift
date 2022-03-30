//
//  InsertfactView.swift
//  Africa
//
//  Created by Wykee Njenga on 3/30/22.
//

import SwiftUI

struct InsertfactView: View {
    let animal: Animal
    
    
    
    var body: some View {
        GroupBox {
            
            TabView{
                
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
                
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
            
        }//box
    }
}

struct InsertfactView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsertfactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
