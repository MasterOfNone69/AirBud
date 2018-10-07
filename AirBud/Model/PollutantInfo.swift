//
//  PollutantInfo.swift
//  AirBud
//
//  Created by Mackenzie Kinzel on 10/6/18.
//  Copyright © 2018 Mackenzie Kinzel. All rights reserved.
//

import Foundation

class PollutantInfo {
    let sources: String?
    let effects: String?
    
    struct PollutantKeys {
        static let sources = "causes"
        static let effects = "effects"
    }
    
    init (pollutantDictionary: [String : Any]) {
        sources = pollutantDictionary[PollutantKeys.sources] as? String
        effects = pollutantDictionary[PollutantKeys.effects] as? String
    }
}
