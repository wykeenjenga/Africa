//
//  VideoModel.swift
//  Africa
//
//  Created by Wykee Njenga on 3/30/22.
//

import Foundation


struct Video: Codable, Identifiable{
    let id: String
    let name: String
    let headline: String
    
    //computed property
    
    var thumnail: String {
        "video-\(id)"
    }
}
