//
//  TodaysTips.swift
//  AirBud
//
//  Created by Mackenzie Kinzel on 10/7/18.
//  Copyright © 2018 Mackenzie Kinzel. All rights reserved.
//

import Foundation

class TodaysTips {
    let children: String?
    let athletes: String?
    
    struct TipKeys {
        static let children = "children"
        static let athletes = "sport"
    }
    
    init (tipDictionary: [String : Any]) {
        children = tipDictionary[TipKeys.children] as? String
        athletes = tipDictionary[TipKeys.athletes] as? String
    }
}

