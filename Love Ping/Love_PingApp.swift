import SwiftUI
import UserNotifications

@main
struct Love_PingApp: App {
    init() {
            Task {
                await requestNotificationPermission()
            }
        }

        var body: some Scene {
            WindowGroup {
                ContentView()
            }
        }
    }

    func requestNotificationPermission() async {
        let center = UNUserNotificationCenter.current()
        do {
            try await center.requestAuthorization(options: [.alert, .sound])
        } catch {
            print("Failed to request notification permissions: \(error)")
        }
    }
