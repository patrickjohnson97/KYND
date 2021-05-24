//
//  ReceiveView.swift
//  KYND
//
//  Created by Patrick Johnson on 5/17/21.
//

import SwiftUI
import CoreImage.CIFilterBuiltins
import MobileCoreServices

struct ReceiveView: View {
    let account = Account(username: "patrick")
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Text("Receive KYND").bold()
                Divider()
                HStack{
                    Spacer()
                    Image(uiImage: generateQRCode(from: "wallet-address"))
                        .interpolation(.none)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: geometry.size.height/4, alignment: .center)
                        .cornerRadius(12)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 12).foregroundColor(Color("card")))
                    Spacer()
                }
                .padding()
                
                
                HStack{
                    HStack(spacing: 2){
                        Image(systemName: "person.fill")
                        Text("@").bold() +
                            Text(account.username).bold()
                    }
                    .font(.title3)
                    .textCase(.lowercase)
                    .foregroundColor(.accentColor)
                    .padding(8)
                    .padding(.horizontal, 4)
                    .background(RoundedRectangle(cornerRadius: 50).foregroundColor(.accentColor).opacity(0.2))
                    
                    Button(action: {
                        UIPasteboard.general.setValue(account.username,
                                                      forPasteboardType: kUTTypePlainText as String)
                    }, label: {
                        Image(systemName: "doc.on.doc")
                    })
                }
                Spacer()
            }
            .padding(.vertical)
        }.navigationBarHidden(true)
    }
    
    func generateQRCode(from string: String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct ReceiveView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiveView()
    }
}
