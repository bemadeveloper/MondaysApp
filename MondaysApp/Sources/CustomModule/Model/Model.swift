import Foundation
import UIKit

extension NameOfSettings {
    var image: UIImage {
        let imageName: String
        switch self {
        case .airmode:
            imageName = "airplane"
        case .wifi:
            imageName = "wifi"
        case .bluetooth:
            let imageBluetooth = UIImage(named: "bluetooth")
            return imageBluetooth ?? UIImage()
        case .mobileData:
            imageName = "antenna.radiowaves.left.and.right"
        case .notifications:
            imageName = "bell.badge.fill"
        case .sounds:
            imageName = "speaker.wave.3.fill"
        case .focus:
            imageName = "moon.fill"
        case .screenTime:
            imageName = "hourglass"
        case .general:
            imageName = "gearshape"
        case .controlCentre:
            imageName = "switch.2"
        case .display:
            imageName = "textformat.size"
        case .homeScreen:
            imageName = "house"
        case .accessibility:
            imageName = "accessibility"
        case .wallpaper:
            imageName = "atom"
        case .siri:
            let imageSiri = UIImage(named: "Siri")
            return imageSiri ?? UIImage()
        case .faceId:
            imageName = "faceid"
        }
        return UIImage(systemName: imageName) ?? UIImage()
    }
    
    var color: UIColor {
        let color: UIColor
        switch self {
        case .airmode:
            color = .systemOrange
        case .wifi:
            color = .systemBlue
        case .bluetooth:
            color = .systemBlue
        case .mobileData:
            color = .systemGreen
        case .notifications:
            color = .systemGreen
        case .sounds:
            color = .systemPink
        case .focus:
            color = .systemPurple
        case .screenTime:
            color = .systemPurple
        case .general:
            color = .systemGray
        case .controlCentre:
            color = .systemGray
        case .display:
            color = .systemBlue
        case .homeScreen:
            color = .systemBlue
        case .accessibility:
            color = .systemBlue
        case .wallpaper:
            color = .systemTeal
        case .siri:
            color = .white
        case .faceId:
            color = .systemGreen
        }
        return color
    }
}

struct CellOfSettings {
    var icon: NameOfSettings
    var nameOfSettings: NameOfSettings
    var chevron: UIImage
}

extension CellOfSettings {
    static var settings: [[CellOfSettings]] = [
        [CellOfSettings(icon: .airmode, nameOfSettings: .airmode, chevron: UIImage(systemName: "chevron.right")!)],
        [CellOfSettings(icon: .wifi, nameOfSettings: .wifi, chevron: UIImage(systemName: "chevron.right")!)],
        [CellOfSettings(icon: .bluetooth, nameOfSettings: .bluetooth, chevron: UIImage(systemName: "chevron.right")!)],
        [CellOfSettings(icon: .mobileData, nameOfSettings: .mobileData, chevron: UIImage(systemName: "chevron.right")!)],
        [CellOfSettings(icon: .notifications, nameOfSettings: .notifications, chevron: UIImage(systemName: "chevron.right")!)],
        [CellOfSettings(icon: .sounds, nameOfSettings: .sounds, chevron: UIImage(systemName: "chevron.right")!)],
        [CellOfSettings(icon: .focus, nameOfSettings: .focus, chevron: UIImage(systemName: "chevron.right")!)],
        [CellOfSettings(icon: .screenTime, nameOfSettings: .screenTime, chevron: UIImage(systemName: "chevron.right")!)],
        [CellOfSettings(icon: .general, nameOfSettings: .general, chevron: UIImage(systemName: "chevron.right")!)],
        [CellOfSettings(icon: .controlCentre, nameOfSettings: .controlCentre, chevron: UIImage(systemName: "chevron.right")!)],
        [CellOfSettings(icon: .display, nameOfSettings: .display, chevron: UIImage(systemName: "chevron.right")!)],
        [CellOfSettings(icon: .homeScreen, nameOfSettings: .homeScreen, chevron: UIImage(systemName: "chevron.right")!)],
        [CellOfSettings(icon: .accessibility, nameOfSettings: .accessibility, chevron: UIImage(systemName: "chevron.right")!)],
        [CellOfSettings(icon: .wallpaper, nameOfSettings: .wallpaper, chevron: UIImage(systemName: "chevron.right")!)],
        [CellOfSettings(icon: .siri, nameOfSettings: .siri, chevron: UIImage(systemName: "chevron.right")!)],
        [CellOfSettings(icon: .faceId, nameOfSettings: .faceId, chevron: UIImage(systemName: "chevron.right")!)]
        
    ]
}
