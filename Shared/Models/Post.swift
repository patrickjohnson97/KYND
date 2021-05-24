//
//  Post.swift
//  KYND
//
//  Created by Patrick Johnson on 5/23/21.
//

import Foundation


struct Post: Identifiable{
    var id = UUID()
    var title: String
    var image: String?
    var text: String
}
