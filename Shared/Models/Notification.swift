//
//  Notification.swift
//  KYND
//
//  Created by Patrick Johnson on 5/23/21.
//

import Foundation

class Notification: Identifiable{
    var id = UUID()
    var text: String
    var from: Account
    init(text: String, from: Account){
        self.text = text
        self.from = from
    }
}

class TransactionNotification: Notification{
    var transaction: Transaction
    init(text: String, from: Account, transaction: Transaction){
        self.transaction = transaction
        super.init(text: text, from: from)
    }
}
