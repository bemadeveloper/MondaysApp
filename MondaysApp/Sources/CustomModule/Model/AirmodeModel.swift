//
//  AirmodeModel.swift
//  MondaysApp
//
//  Created by Bema on 12/4/24.
//

import Foundation
import UIKit

struct AirmodeModel: Hashable {
    let icon: Airmode
    let switcher: UISwitch
}

enum Airmode: String {
    case airmode = "airplane"
}

extension Airmode {
    var image: UIImage {
        let imageName: String
        switch self {
        case .airmode:
            imageName = "airplane"
        }
        return UIImage(systemName: imageName) ?? UIImage()
    }
    
    var color: UIColor {
        let color: UIColor
        switch self {
        case .airmode:
            color = .systemOrange
        }
        return color
    }
}
