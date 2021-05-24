//
//  Transaction.swift
//  KYND
//
//  Created by Patrick Johnson on 5/17/21.
//

import Foundation

struct Transaction: Identifiable {
    var id = UUID()
    var amount: Double
    var from: Account
    var to: Account
    var notes: String = ""
    var image: String?
    var date: Date = Date()
}
