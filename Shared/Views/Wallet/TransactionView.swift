//
//  TransactionView.swift
//  KYND
//
//  Created by Patrick Johnson on 5/22/21.
//

import SwiftUI

struct TransactionView: View {
    @State var account: Account
    @State var transaction: Transaction
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                Divider()
                
                VStack{
                    if(transaction.image != nil){
                        Image(transaction.image!)
                            .resizable()
                            .frame(height: geometry.size.height/2.7)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(18)
                    }
                    if(transaction.notes != ""){
                        
                        HStack(alignment: .bottom){
                            transaction.from.profilePicture.profilePicture
                            Spacer()
                            HStack(){
                                Text(transaction.notes)
                                    .fixedSize(horizontal: false, vertical: true)
                                Spacer()
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).foregroundColor(.gray).opacity(0.2))
                        }
                        .padding(.bottom)
                    }
                    HStack{
                        Text("TRANSACTION DETAILS").font(.caption).bold().foregroundColor(.gray)
                        Spacer()
                    }
                    Divider()
                    HStack{
                        Text("Amount")
                        Spacer()
                        Text(transaction.amount.transactionAmount)
                    }
                    Divider()
                    HStack{
                        Text("Date")
                        Spacer()
                        Text(transaction.date.transactionLongDate)
                    }
                }
                .padding()
            }
        }
        .navigationTitle(getTitle())
        
    }
    
    func getTitle() -> String {
        return transaction.to == account ? "From @" + transaction.from.username.lowercased() : "To @" + transaction.to.username.lowercased()
    }
    
    func getTargetAccount() -> Account {
        return transaction.to == account ? transaction.from : transaction.to
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView(account: Account(username: "me"), transaction: Transaction(amount: 30.5, from: Account(username: "me"), to: Account(username: "you")))
    }
}
