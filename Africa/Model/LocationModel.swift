//
//  LocationModel.swift
//  Africa
//
//  Created by Wykee Njenga on 3/30/22.
//

import Foundation
import MapKit


struct NationalParksLocation: Codable, Identifiable{
    
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    //computed property
    var location: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}

