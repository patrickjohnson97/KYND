//
//  Account.swift
//  KYND
//
//  Created by Patrick Johnson on 5/18/21.
//

import Foundation

struct Account: Identifiable, Equatable{
    static func == (lhs: Account, rhs: Account) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var username: String
    var balance: Double = 0.0
    var transactions = [Transaction]()
    var profilePicture: String = ""
    var bio: String = ""
    var posts = [Post]()
}
