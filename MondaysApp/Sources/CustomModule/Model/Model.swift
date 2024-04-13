import Foundation
import UIKit

struct Model {
    let type: NameOfSettings
    var kind: CellType?
}

enum NameOfSettings: String {
    case wifi = "Wi-Fi"
    case bluetooth = "Bluetooth"
    case mobileData = "Сотовая связь"
    case notifications = "Уведомления"
    case sounds = "Звуки, тактильные сигналы"
    case focus = "Фокусирование"
    case screenTime = "Экранное время"
    case general = "Основные"
    case controlCentre = "Пункт управления"
    case display = "Экран и яркость"
    case homeScreen = "Экран <Домой>"
    case accessibility = "Унверсальный доступ"
    case wallpaper = "Обои"
    case siri = "Siri и поиск"
    case faceId = "Face ID и код-пароль"
}

extension NameOfSettings {
    var image: UIImage {
        let imageName: String
        switch self {
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

enum CellType {
    case connectionInfo(value: ConnectionInfo)
    case notification(count: Int)
}

enum ConnectionInfo: CustomStringConvertible {
    case turnOn
    case turnOff
    case notConnected
    case connected
    case connectedEmptyInfo

    var description: String {
        switch self {
        case .turnOn:
            "Вкл."
        case .turnOff:
            "Выкл."
        case .notConnected:
            "Не подключен"
        case .connected:
            "Подключен"
        case .connectedEmptyInfo:
            ""
        }
    }
}


