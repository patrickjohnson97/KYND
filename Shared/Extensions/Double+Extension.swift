//
//  Double+Extensions.swift
//  KYND
//
//  Created by Patrick Johnson on 5/23/21.
//

import Foundation


extension Double{
    var transactionAmount: String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self))!
    }
}
