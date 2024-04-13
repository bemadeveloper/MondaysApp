//
//  AirmodeModel.swift
//  MondaysApp
//
//  Created by Bema on 12/4/24.
//

import Foundation
import UIKit

struct AirmodeModel {
    var iconAir: UIImage
    var title = "Авиарежим"
    var switcher: UISwitch
}

extension AirmodeModel {
    static var airmode: [[AirmodeModel]] = [
        [AirmodeModel(iconAir: UIImage(systemName: "airplane") ?? UIImage(), switcher: UISwitch())]
    
    ]
}
