//
//  WalletView.swift
//  KYND
//
//  Created by Patrick Johnson on 5/8/21.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct WalletView: View {
    @State var account: Account = Account(username: "patrickjohnson", profilePicture: "selfie")
    @State var showSendSheet: Bool = false
    @State var showReceiveSheet: Bool = false
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    HStack{
                        VStack{
                            Text(account.balance.transactionAmount).font(.largeTitle).bold().hidden()
                            Text(account.balance.transactionAmount).font(.largeTitle).bold().hidden()
                            HStack{
                                Text("Balance: ")
                                    .font(.largeTitle).bold() +
                                    Text(account.balance.transactionAmount).font(.largeTitle).bold()
                            }
                            .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    HStack{
                        Button(action: {showSendSheet = true}, label: {
                            HStack{
                                Spacer()
                                Image(systemName: "arrow.up.forward").foregroundColor(.gray)
                                Text("Send").textCase(.uppercase).font(.headline)
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).foregroundColor(.gray).opacity(0.2))
                            .sheet(isPresented: $showSendSheet, content: {
                                SendView()
                            })
                        })
                        .buttonStyle(PlainButtonStyle())
                        Spacer()
                        Button(action: {showReceiveSheet = true}, label: {
                            HStack{
                                Spacer()
                                Image(systemName: "arrow.down.forward").foregroundColor(.gray)
                                Text("Receive").textCase(.uppercase).font(.headline)
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).foregroundColor(.gray).opacity(0.2))
                            .sheet(isPresented: $showReceiveSheet, content: {
                                ReceiveView()
                            })
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
                .background(Rectangle().foregroundColor(.accentColor))
                ScrollView{
                    ForEach(account.transactions.sorted(by: { $0.date < $1.date})){ transaction in
                        NavigationLink(destination: TransactionView(account: account, transaction: transaction), label: {
                            HStack{
                                Image(systemName: transaction.to == account ? "arrow.down.forward" : "arrow.up.forward")
                                    .foregroundColor(transaction.to == account ? .green : .red)
                                    .padding(8)
                                    .background(Circle().foregroundColor(transaction.to == account ? .green : .red).opacity(0.2))
                                HStack(spacing: 4){
                                    Image(systemName: "person.fill").foregroundColor(.accentColor)
                                    HStack{
                                        Text("@").bold() +
                                            Text(transaction.to == account ? transaction.from.username : transaction.to.username).bold()
                                    }
                                    .textCase(.lowercase)
                                    .foregroundColor(.accentColor)
                                    .lineLimit(1)
                                }
                                .padding(6)
                                .padding(.horizontal, 6)
                                .background(RoundedRectangle(cornerRadius: 30).foregroundColor(.accentColor).opacity(0.2))
                                Text("a day ago").foregroundColor(.gray)
                                Spacer()
                                if(transaction.from == account){
                                    Text("-") +
                                        Text(transaction.amount.transactionAmount)
                                } else{
                                    Text(transaction.amount.transactionAmount)
                                        .foregroundColor(.green)
                                }
                            }
                            .padding(.horizontal)
                        })
                        .buttonStyle(PlainButtonStyle())
                        Divider()
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            .navigationBarHidden(true)
        }
        .onAppear(perform: {
            let alexa = Account(username: "Alexa")
            account.transactions = [Transaction(amount: 20, from: account, to: alexa, notes: "Thank you so much for the kind words, I hope you have a great day!", image: "volunteer"), Transaction(amount: 30, from: account, to: alexa), Transaction(amount: 1112, from: account, to: alexa), Transaction(amount: 37.11832, from: alexa, to: account)]
        })
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
