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
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible()) ]
    
    @State private var gridColumn: Int = 1
    
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    
    //Function
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        
        gridColumn = gridLayout.count
        
        print("Grid: \(gridColumn)")
        
        
        //toolbar image
        
        switch gridColumn {
            
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    
    
    //body
    var body: some View {
        
        
        NavigationView{
            
            Group{
                
                if !isGridViewActive {
                    List {
                        
                        //MARK: - top part
                        
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0,
                                                      bottom: 0, trailing: 0))
                        
                        
                        //MARK: - animal list
                        ForEach(animals){ animal in
                            NavigationLink(destination: AnimalDetaileView(animal: animal)) {
                                
                                AnimalListItemView(animal: animal)
                            
                            }
                            
                        }//loop animals in a list
                        
                        
                        CreditsView()
                            .modifier(CenterModifier())
                        
                    }
                } else {
                    
            
                    ScrollView(.vertical, showsIndicators: false){
                        
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                             
                            ForEach(animals) { animal in
                                
                                NavigationLink(destination: AnimalDetaileView(animal: animal)) {
                                    
                                    AnimalGridItemView(animal: animal)
                                
                                }
                            }
                        }
                        .padding(10)
                        .animation(.easeOut)
                        
                    }
                }//list
                
            }

            .navigationBarTitle("Welcome to Africa", displayMode: .large)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(spacing: 16){
                        
                        //list
                        Button(action: {
                            print("List View is Activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }){
                            Image(systemName: "square.grid.1x2")
                                .font(.title2)
                                .foregroundColor(.accentColor)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        //Grid
                        Button(action: {
                            print("List View is Activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }){
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                        
                    }//hstack
                }
            }
            
        }//navigation
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
