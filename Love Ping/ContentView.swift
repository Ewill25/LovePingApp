import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
            VStack {
                Image(systemName: "heart.fill")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Send Love")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .onTapGesture {
                        sendLoveNotification()
                    }
            }
            .padding()
        }

        func sendLoveNotification() {
            Task {
                await sendNotification()
            }
        }

        func sendNotification() async {
            let content = UNMutableNotificationContent()
            content.title = "Love Ping"
            content.body = "I love you"
            content.sound = UNNotificationSound.default

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false) // 5 seconds delay for demonstration

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

            do {
                try await UNUserNotificationCenter.current().add(request)
            } catch {
                print("Failed to send notification: \(error)")
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

