//
//  Date+Extension.swift
//  KYND
//
//  Created by Patrick Johnson on 5/23/21.
//

import Foundation


extension Date{
    var transactionShortDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: self)
    }
    
    var transactionLongDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        return dateFormatter.string(from: self)
    }
}
