//
//  APIKey.swift
//  IchigoIkku
//
//  Created by Uzu83 on 2024/11/14
//  
//

import Foundation

enum APIKey {
    static var `default`: String {
        guard let filePath = Bundle.main.path(forResource: "GenerativeAI-Info", ofType: "plist") else {
            fatalError("Couldn't find file 'GenerativeAI-Info.plist'.")
        }
        
        guard let plist = NSDictionary(contentsOfFile: filePath) else {
            fatalError("Couldn't read from 'GenerativeAI-Info.plist'.")
        }
        
        guard let value = plist.object(forKey: "API_KEY") as? String else {
            fatalError("Couldn't find key 'API_KEY' in 'GenerativeAI-Info.plist'.")
        }
        
        if value.starts(with: "_") {
            fatalError("Follow the instructions at https://ai.google.dev/tutorials/setup to get an API key.")
        }
        
        return value
    }
}
