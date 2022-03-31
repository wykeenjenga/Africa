//
//  Modifier.swift
//  Africa
//
//  Created by Wykee Njenga on 3/31/22.
//

import SwiftUI


struct CenterModifier: ViewModifier{
    
    func body(content: Content) -> some View{
        
        HStack{
            Spacer()
            
            content
            
            Spacer()
            
        }
        
    }
}
