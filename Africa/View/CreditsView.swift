//
//  CreditsView.swift
//  Africa
//
//  Created by Wykee Njenga on 3/30/22.
//

import SwiftUI

struct CreditsView: View {
    
    
    var body: some View {
        
        
        VStack {
            
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128, alignment: .center)
            
            
            Text("""

    Copyright © Wycliff Njenga
     All right reserved

    Made with ♡ by WykSofts Inc

    """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
        
        
        
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
