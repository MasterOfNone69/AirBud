//
//  HomeVC.swift
//  AirBud
//
//  Created by Mackenzie Kinzel on 10/6/18.
//  Copyright © 2018 Mackenzie Kinzel. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var aqiLabel: UILabel!
    @IBOutlet weak var aqiDescriptionLabel: UILabel!
    @IBOutlet weak var pollutantLabel: UILabel!
    @IBOutlet weak var sourcesLabel: UILabel!
    @IBOutlet weak var effectsLabel: UILabel!
    
    
    let APIKey = "a3b1088cb53a4273b0c958a43183cf55"
    let coordinate: (lat: Double, long: Double) = (41.0789035, -81.51971272299431)
    var airService: AirService!

    override func viewDidLoad() {
        super.viewDidLoad()
        airService = AirService(APIKey: APIKey)
        
        airService.getCurrentAir { (currentAir) in
            
                if let currentAir = currentAir {
                    
                  DispatchQueue.main.async {
                    
                    if let aqi = currentAir.aqi {
                        self.aqiLabel.text = "\(aqi)"
                    } else {
                        self.aqiLabel.text = "-"
                    }
                    
                    if let description = currentAir.description {
                        self.aqiDescriptionLabel.text = "\(description)"
                    } else {
                        self.aqiDescriptionLabel.text = "-"
                    }
                    
                    if let pollutant = currentAir.pollutant {
                        self.pollutantLabel.text = "\(pollutant)"
                    } else {
                        self.pollutantLabel.text = "-"
                    }
                    
                    if let sources = currentAir.sources {
                        self.sourcesLabel.text = "\(sources)"
                    } else {
                        self.sourcesLabel.text = "-"
                    }
                    
                    if let effects = currentAir.effects {
                        self.effectsLabel.text = "\(effects)"
                    } else {
                        self.effectsLabel.text = "-"
                    }
                }
            }
        }
    }
}

