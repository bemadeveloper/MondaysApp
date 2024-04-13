import Foundation

struct SettingsGrouped {
    
    static func createGroupedSettings() -> [[Model]] {
        let primaryGroup = [
            Model(type: .wifi, kind: .connectionInfo(value: .connected)),
            Model(type: .bluetooth, kind: .connectionInfo(value: .notConnected)),
            Model(type: .mobileData, kind: .connectionInfo(value: .turnOn)),
        ]

        let secondaryGroup = [
            Model(type: .notifications),
            Model(type: .sounds),
            Model(type: .focus),
            Model(type: .screenTime),
        ]

        let tertiaryGroup = [
            Model(type: .general, kind: .notification(count: 3)),
            Model(type: .controlCentre),
            Model(type: .display),
            Model(type: .homeScreen),
            Model(type: .accessibility),
            Model(type: .wallpaper),
            Model(type: .siri),
            Model(type: .faceId),
        ]

        let groupedSettings = [
            primaryGroup,
            secondaryGroup,
            tertiaryGroup,
        ]
        return groupedSettings
    }
}
