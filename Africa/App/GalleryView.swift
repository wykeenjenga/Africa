//
//  GalleryView.swift
//  Africa
//
//  Created by Wykee Njenga on 3/29/22.
//

import SwiftUI
import simd

struct GalleryView: View {
    
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    //simple grid defn
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
    //modern grid defn
    
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    
    //dynamic grid layout
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    
    func gridSwitch(){
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridColumn))
    }
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            
            VStack (alignment: .center, spacing: 30){
                
                //Image
                
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                
                //SLIDER
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { value in
                        gridSwitch()
                    })
                    
                
        
                
                //GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                    
                    ForEach(animals) { item in
        
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
//                            .clipShape(Circle())
//                            .overlay(Circle().stroke(Color.accentColor, lineWidth: 1))
                            .frame(width: 100, height: 50, alignment: .center)
                            .cornerRadius(12)
                            .onTapGesture {
                                haptics.impactOccurred()
                                selectedAnimal = item.image
                            }
                        
                        
                        
                    }//loop
                }
                //lazygrid
                .animation(.easeOut)
                .onAppear(perform: {
                    gridSwitch()
                })
                
                
            }//vstck
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        
        //scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
