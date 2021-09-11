//
//  ContentView.swift
//  Keep Silent
//
//  Created by SmartPan on 9/10/21.
//

import SwiftUI
import UserNotifications

struct HomeScreen: View {
    @State var enteredPeriod: String = ""

    var body: some View {
      ZStack{
        VStack(alignment: .leading) {
            Text("Time Period")
                .font(.callout)
                .bold()
            TextField("Enter Time...", text: $enteredPeriod)
            Button("Save") {
                ReminderManager().requestAuthorization { (authorized) in
                    if authorized {
                        let request = ReminderFactory().createReminderRequest(reminder: Reminder(title: "Keep Silent", timeInterval:  Double(enteredPeriod)!*60, body: "silence is golden", identifier: UUID().uuidString))
                        ReminderManager().scheduleReminder(request: request!)
                    }
                }
            }
            .disabled(enteredPeriod.isEmpty ? true : false)
            .padding()

        }.padding()
      }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
