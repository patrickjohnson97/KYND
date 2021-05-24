//
//  String.swift
//  KYND
//
//  Created by Patrick Johnson on 5/23/21.
//

import Foundation
import SwiftUI

extension String{
    @ViewBuilder
    var profilePicture: some View{
        if(self != ""){
            Image(self)
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .clipped()
        }
        else{
            Image(systemName: "person.fill").foregroundColor(.gray)
                .padding()
                .background(Circle().frame(width: 50).foregroundColor(.gray).opacity(0.2))
        }
    }
    
    @ViewBuilder
    var avatarPicture: some View{
        if(self != ""){
            Image(self)
                .resizable()
                .frame(width: 80, height: 80, alignment: .center)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .clipped()
        }
        else{
            Image(systemName: "person.fill").foregroundColor(.gray)
                .padding(12)
                .background(Circle().frame(width: 50).foregroundColor(.gray).opacity(0.2))
        }
    }
}
