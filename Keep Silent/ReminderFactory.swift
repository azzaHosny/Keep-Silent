//
//  NotificationFactory.swift
//  Keep Silent
//
//  Created by SmartPan on 9/11/21.
//

import Foundation
import UserNotifications

enum ReminderType {
    case keepSilent
    case keepProgress
}
struct Reminder {
    let title: String
    let timeInterval: Double
    let body: String
    let type: ReminderType = .keepSilent
    let identifier: String
    let isRepeatable: Bool = false
}
struct ReminderFactory {
    
    func createReminderRequest(reminder: Reminder) -> UNNotificationRequest? {
        switch reminder.type {
        case .keepProgress:
            break
        case .keepSilent:
            let content = UNMutableNotificationContent()
            content.title = reminder.title
            content.body =  reminder.body
            content.sound = UNNotificationSound.defaultCritical
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: reminder.timeInterval, repeats: true)
            return UNNotificationRequest(identifier: reminder.identifier, content: content, trigger: trigger)
        }
        return nil
    }
}
