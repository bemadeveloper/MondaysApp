//
//  GroupedAirmode.swift
//  MondaysApp
//
//  Created by Bema on 13/4/24.
//

import Foundation
import UIKit

struct GroupedAirmode {
    
    static func createGroup() -> [[AirmodeModel]] {
        [[AirmodeModel(icon: .airmode, switcher: UISwitch())]
        ]
    }
}
