//
//  MapView.swift
//  Africa
//
//  Created by Wykee Njenga on 3/29/22.
//

import SwiftUI
import MapKit


struct MapView: View {
    
    //properties
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates =  CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel =  MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion =  MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion;
    }()
    
    let locations: [NationalParksLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        
        //basic map
        //Map(coordinateRegion: $region)
        
        //advanced app
        Map(coordinateRegion: $region, annotationItems: locations,
            annotationContent: { item in
            
            //A - old style
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            //B - new style
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            //C - custom
//            MapAnnotation(coordinate: item.location){
//
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//
//            }//annotation
            
            //D - custom advanced
            
            MapAnnotation(coordinate: item.location){
                MapAnnotationView(location: item)
            }
            
        })//map
    
        .overlay(
            
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3){
                    HStack {
                        Text("latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                    }
                }
                
            
                
            }//hstack
                .padding(.vertical, 12)
                .padding(.horizontal,16)
                .background(
                
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                
                )
                .padding()
            , alignment: .bottom
        )
    }
    
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
