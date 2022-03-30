//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Wykee Njenga on 3/29/22.
//


import Foundation

extension Bundle {
    
    func decode <T: Codable>(_ file: String) -> T {
        
        //1. locate json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        //2. create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in bundle.")
        }
        
        //3. create a decorder
        let decoder = JSONDecoder()

        
        //4. create a property for the deocoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        
        //5. Return the ready use data
        
        return loaded
    }
    
}
