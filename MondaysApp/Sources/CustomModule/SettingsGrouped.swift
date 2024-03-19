import Foundation

struct SettingsGrouped {
    static func createGroupedSettings() -> [[Setting]] {
        let primaryGroup = [
            Setting(type: .airmode, kind: .switcher(value: false)),
            Setting(type: .wifi, kind: .connectionInfo(value: .connected)),
            Setting(type: .bluetooth, kind: .connectionInfo(value: .notConnected)),
            Setting(type: .mobileData, kind: .connectionInfo(value: .turnOn)),
        ]

        let secondaryGroup = [
            Setting(type: .notifications),
            Setting(type: .sounds),
            Setting(type: .focus),
            Setting(type: .screenTime),
        ]

        let tertiaryGroup = [
            Setting(type: .general, kind: .notification(count: 3)),
            Setting(type: .controlCentre),
            Setting(type: .display),
            Setting(type: .homeScreen),
            Setting(type: .accessibility),
            Setting(type: .wallpaper),
            Setting(type: .siri),
            Setting(type: .faceId),
        ]

        let groupedSettings = [
            primaryGroup,
            secondaryGroup,
            tertiaryGroup,
        ]
        return groupedSettings
    }
}
