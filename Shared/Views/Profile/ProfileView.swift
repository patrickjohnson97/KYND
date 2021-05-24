//
//  ProfileView.swift
//  KYND
//
//  Created by Patrick Johnson on 5/8/21.
//

import SwiftUI

struct ProfileView: View {
    let account = Account(username: "patrick", profilePicture: "selfie", bio: "I just want to leave this world better than I found it.", posts: [Post(title: "My new job", image: "job", text: "Today I started my new job as a software developer. I am so excited to begin work."), Post(title: "My new job", image: "shiba", text: "Today I started my new job as a software developer. I am so excited to begin work."),Post(title: "My new job", image: "engagement", text: "Today I started my new job as a software developer. I am so excited to begin work."),Post(title: "My new job", image: "moving", text: "Today I started my new job as a software developer. I am so excited to begin work.")])
    @State var showFullBio = false
    var body: some View {
        VStack{
            HStack{
                Button(action: {}, label: {
                    Text("Edit")
                })
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "gear")
                })
            }.padding(.horizontal)
            HStack(alignment: .top){
                account.profilePicture.avatarPicture
                VStack(alignment: .leading){
                    Text("@" + account.username).font(.headline).bold().foregroundColor(.accentColor)
//                        .padding(6).padding(.horizontal, 4).background(Capsule().foregroundColor(.accentColor).opacity(0.2))
//                    Text("About me").bold().font(.caption).textCase(.uppercase).foregroundColor(.gray)
                    Text(account.bio).font(.subheadline)
                        .lineLimit(showFullBio ? 20 : 2)
                        .padding(6).padding(.horizontal, 4).background(RoundedRectangle(cornerRadius: 12).foregroundColor(.gray).opacity(0.2))
                        .onTapGesture(perform: {
                            showFullBio.toggle()
                        })
                }
                Spacer()
            }
            .padding(.horizontal)
            Divider()
            GeometryReader{ geometry in
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 4), GridItem(.flexible(), spacing: 4), GridItem(.flexible(), spacing: 4)], spacing: 4){
                    ForEach(account.posts){ post in
                        Image(post.image ?? "selfie")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width/3 - 6, height: geometry.size.width/3 - 6)
                            .clipped()
                    }
                }
                .padding(.horizontal, 6)
                Spacer()
            }
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
