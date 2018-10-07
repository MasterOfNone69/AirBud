//
//  CurrentAir.swift
//  AirBud
//
//  Created by Mackenzie Kinzel on 10/6/18.
//  Copyright © 2018 Mackenzie Kinzel. All rights reserved.
//

import Foundation

class CurrentAir {
    let aqi: Int?
    let description: String?
    let pollutant: String?
    
    struct AirKeys {
    static let aqi = "breezometer_aqi"
    static let description = "breezometer_description"
    static let pollutant = "dominant_pollutant_description"
    }
    
    init(airDictionary: [String : Any]) {
        aqi = airDictionary[AirKeys.aqi] as? Int
        description = airDictionary[AirKeys.description] as? String
        pollutant = airDictionary[AirKeys.pollutant] as? String
    }
}
