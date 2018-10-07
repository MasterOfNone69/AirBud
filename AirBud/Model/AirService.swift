//
//  AirService.swift
//  AirBud
//
//  Created by Mackenzie Kinzel on 10/6/18.
//  Copyright © 2018 Mackenzie Kinzel. All rights reserved.
//

import Foundation
import Alamofire

class AirService {
    
    let APIKey: String
    let baseURL: URL?
    
    init(APIKey: String) {
        self.APIKey = APIKey
        baseURL = URL(string: "https://api.breezometer.com/baqi/?lat=41.0789035&lon=-81.51971272299431&key=\(APIKey)")
    }
    
    func getCurrentAir(completion: @escaping (CurrentAir?) -> Void) {
        
        if let airURL = URL(string: "\(baseURL!)") {
            
            Alamofire.request(airURL).responseJSON(completionHandler: { (response) in
                
                if let jsonDictionary = response.result.value as? [String : Any] {
                    
                    if let currentAirDictionary = jsonDictionary as? [String : Any] {
                        
                        let currentAir = CurrentAir(airDictionary: currentAirDictionary)
                        
                        completion(currentAir)
                        
                    } else {
                        completion(nil)
                    }
                }
            })
        }
    }
    
    func getPollutantInfo(completion: @escaping (PollutantInfo?) -> Void) {

        if let airURL = URL(string: "\(baseURL!)") {

            Alamofire.request(airURL).responseJSON(completionHandler: { (response) in

                if let jsonDictionary = response.result.value as? [String : Any] {

                    if let currentPollutantDictionary = jsonDictionary["dominant_pollutant_text"] as? [String : Any] {

                        let pollutantInfo = PollutantInfo(pollutantDictionary: currentPollutantDictionary)

                        completion(pollutantInfo)

                    } else {
                        completion(nil)
                    }
                }
            })
        }
    }
    
    func getTodaysTips(completion: @escaping (TodaysTips?) -> Void) {
        
        if let airURL = URL(string: "\(baseURL!)") {
            
            Alamofire.request(airURL).responseJSON(completionHandler: { (response) in
                
                if let jsonDictionary = response.result.value as? [String : Any] {
                    
                    if let currentTipDictionary = jsonDictionary["random_recommendations"] as? [String : Any] {
                        
                        let todaysTips = TodaysTips(tipDictionary: currentTipDictionary)
                        
                        completion(todaysTips)
                        
                    } else {
                        completion(nil)
                    }
                }
            })
        }
    }
}
