//
//  NotificationManager.swift
//  Keep Silent
//
//  Created by SmartPan on 9/11/21.
//

import UserNotifications

struct ReminderManager {
    
    func requestAuthorization(completion: @escaping  (Bool) -> Void) {
      UNUserNotificationCenter.current()
        .requestAuthorization(options: [.alert, .sound, .badge]) { authorized, error  in
            if authorized {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
          completion(authorized)
        }
    }
    func scheduleReminder(request: UNNotificationRequest) {
        UNUserNotificationCenter.current().add(request) { error in
          if let error = error {
            print(error)
          } else {
            print("notification is added")
          }
        }
    }
}
