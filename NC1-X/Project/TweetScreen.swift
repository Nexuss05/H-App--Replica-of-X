//
//  TweetScreen.swift
//  NC1-X
//
//  Created by Matteo Cotena on 20/11/23.
//

import SwiftUI
import SwiftData
//import ImageViewer

struct TweetScreen: View {
    
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    var tweet: Tweet
    //    var tweet2: activity
//    var contr: Bool
    
    @State private var selectedItem = "Dark"
    //    var id: String
    
    var body: some View {
        
        NavigationStack{
            HStack{
                VStack{
                    HStack{
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.leading, 25)
                            .padding(.trailing, 10)
                            .padding(.bottom, 10)
                            .accessibilityHidden(true)
                        Text(tweet.nickname)
                            .padding(.bottom, 10)
                        Spacer()
                        Menu(content: {
                            Button("Delete") {
                                deletefunc(twitt: tweet)
                                dismiss.callAsFunction()
                            }
                            
                            //                                Button("Delete", action: deletefunc(twitt:tweet))
                            
                        }, label: {Image(systemName: "ellipsis").padding(.bottom, 10)})
                        .padding(.trailing, 10)
                        .foregroundStyle(.gray)
                        //                            Image(systemName: "ellipsis")
                    }
                    HStack{
                        Text(tweet.text)
                            .padding(10)
                        Spacer()
                    }
                    
                    if (tweet.image?.isEmpty == false) {
                        let uiImage = UIImage(data: tweet.image ?? Data())
                        Image(uiImage:  uiImage ?? uiImage!)
                            .resizable()
                            .scaledToFit()
                        Spacer()
                    }
                    Divider()
                        .padding(.bottom, 10)
                    HStack{
                        // repost, citazioni, mi piace, segnalibri
                        Text(String(Int.random(in: 1..<100)))
                            .bold()
                        Text("Repost")
                            .foregroundStyle(.gray)
                        Text(String(Int.random(in: 1..<50)))
                            .bold()
                        Text("Quotes")
                            .foregroundStyle(.gray)
                        Text(String(Int.random(in: 1..<300)))
                            .bold()
                        Text("Likes")
                            .foregroundStyle(.gray)
                        Text(String(Int.random(in: 1..<50)))
                            .bold()
                        Text("Bookmarks")
                            .foregroundStyle(.gray)
                    }
                    Divider()
                        .padding(.top, 6)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }
            .padding(.top, 10)
            Divider()
            
        }
        .navigationBarTitle("Post", displayMode: .inline)
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: Button(action: {
            dismiss.callAsFunction()
        }) {
            Image(systemName: "arrow.backward")
                .foregroundStyle(.white)
        })
        
    }
    
    func deletefunc(twitt:Tweet){
        context.delete(twitt)
    }
    
}

//#Preview {
//    TweetScreen(tweet:  Tweet(nickname: "Apple Education", text: "At Istituto Comprensivo Statale G. Ungaretti, Professional Learning is not about teachers doing it alone. With iPad, educators share their experiences and learn together, creating a fun environment that’s transforming how they teach.", image: nil, type: true), contr: true)
//}
