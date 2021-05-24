//
//  NotifsVIew.swift
//  KYND
//
//  Created by Patrick Johnson on 5/8/21.
//

import SwiftUI

struct NotifsView: View {
    let notifications: [Notification] = [TransactionNotification(text: "You received a new transaction from", from: Account(username: "alexa", profilePicture: "selfie"), transaction: Transaction(amount: 30.5, from: Account(username: "alexa"), to: Account(username: "patrick"))), TransactionNotification(text: "You received a new transaction from", from: Account(username: "anhthan", profilePicture: "selfie"), transaction: Transaction(amount: 30.5, from: Account(username: "alexa"), to: Account(username: "patrick")))]
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    ForEach(notifications){ notif in
                        Divider()
                        HStack(alignment: .top){
                            notif.from.profilePicture.profilePicture
                            HStack{
                                Text(notif.text + " ")
                                    + Text("@" + notif.from.username).bold().foregroundColor(.accentColor)
                                    + Text(" • 1h").foregroundColor(.gray)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Notifications")
        }
    }
}

struct NotifsView_Previews: PreviewProvider {
    static var previews: some View {
        NotifsView()
    }
}
