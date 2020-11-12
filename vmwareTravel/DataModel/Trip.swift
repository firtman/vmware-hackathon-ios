//
//  Trip.swift
//  vmwareTravel
//
//

import Foundation

class Trip: Codable {  // We use Codable toconvert from/to JSON
    var name: String
    var description: String
    
    init(fromName name: String, andDescription description: String) {
        self.name = name
        self.description = description
    }
}
