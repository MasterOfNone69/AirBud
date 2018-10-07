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
    @IBOutlet weak var childrenLabel: UILabel!
    @IBOutlet weak var athletesLabel: UILabel!
    
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
                    
                    if let color = currentAir.color {
                        self.aqiLabel.backgroundColor = UIColor().HexToColor(hexString: "\(color)", alpha: 1.0)
                        
                    } else {
                        self.aqiLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    }
                }
            }
        }
        
        airService.getPollutantInfo { (pollutantInfo) in
            
            if let pollutantInfo = pollutantInfo {
                
                DispatchQueue.main.async {
                    
                    if let sources = pollutantInfo.sources {
                        self.sourcesLabel.text = "\(sources)"
                    } else {
                        self.sourcesLabel.text = "-"
                    }
                    
                    if let effects = pollutantInfo.effects {
                        self.effectsLabel.text = "\(effects)"
                    } else {
                        self.effectsLabel.text = "-"
                    }
                }
            }
        }
        
        airService.getTodaysTips{ (todaysTips) in
            
            if let todaysTips = todaysTips {
                
                DispatchQueue.main.async {
                    
                    if let children = todaysTips.children {
                        self.childrenLabel.text = "\(children)"
                    } else {
                        self.childrenLabel.text = "-"
                    }
                    
                    if let athletes = todaysTips.athletes {
                        self.athletesLabel.text = "\(athletes)"
                    } else {
                        self.athletesLabel.text = "-"
                    }
                }
            }
        }
    }
}

extension UIColor{
    func HexToColor(hexString: String, alpha:CGFloat? = 1.0) -> UIColor {
        // Convert hex string to an integer
        let hexint = Int(self.intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha = alpha!
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    func intFromHexString(hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = NSCharacterSet(charactersIn: "#") as CharacterSet
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
}
