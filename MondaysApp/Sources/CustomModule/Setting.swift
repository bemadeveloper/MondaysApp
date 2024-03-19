//
//  Setting.swift
//  MondaysApp
//
//  Created by Bema on 18/3/24.
//

import Foundation

struct Setting {
    let type: NameOfSettings
    var kind: CellType?
}

enum NameOfSettings: String {
    case airmode = "Авиарежим"
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

enum CellType {
    case switcher(value: Bool)
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

