//
//  SendView.swift
//  KYND
//
//  Created by Patrick Johnson on 5/21/21.
//

import SwiftUI

struct SendView: View {
    @State var address: String = ""
    @State var message: String = ""
    var body: some View {
        GeometryReader{ geometry in
        VStack{
            HStack{
                Spacer()
                Text("Send KYND").bold()
                Spacer()
            }
            Divider()
            HStack{
                TextField("Username", text: $address)
                    .padding(8)
                    .padding(.horizontal, 4)
                    .background(RoundedRectangle(cornerRadius: 50).foregroundColor(.gray).opacity(0.2))
                Spacer()
                Button(action: {
                }
                , label: {
                    Image(systemName: "qrcode.viewfinder")
                        .padding(8)
                        .background(Circle().foregroundColor(.accentColor).opacity(0.2))
                })
            }
            ZStack(alignment: .topLeading){
                TextEditor(text: $message)
                    .padding(.bottom)
                Text(message == "" ? "Message (optional)" : message).opacity(message == "" ? 0.4 : 0)
                    .lineLimit(2)
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action: {
                        }
                        , label: {
                            Image(systemName: "photo")
                                .padding(10)
                                .background(Circle().opacity(0.2))
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 12).foregroundColor(.gray).opacity(0.2))
            .frame(height: geometry.size.height/4)
            Button(action: {
            }
            , label: {
                HStack{
                    Spacer()
                    Text("Hold to send").bold().font(.headline).textCase(.uppercase)
                    Spacer()
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 12).foregroundColor(.accentColor).opacity(0.2))
            })
            
            Spacer()
        }
        .padding()
        }
    }
}

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView()
    }
}
