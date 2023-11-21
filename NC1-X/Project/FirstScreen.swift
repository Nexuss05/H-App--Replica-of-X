//
//  FirstScreen.swift
//  NC1-X
//
//  Created by Matteo Cotena on 15/11/23.
//

import Foundation
import SwiftUI
import SwiftData

struct FirstScreen: View {
    @State private var sec: Bool = true
    @Environment(\.modelContext) var context
    @Query var tweets: [Tweet] = []
    @State private var isModalPresented = false
    @State var address = ""
    //    @Binding var isPresented: Bool
//    var activity = TweetViewModel()
    @State private var dragOffset: CGFloat = 0.0
    @State private var controlHeight: CGFloat = 0.0
    
    var body: some View {
        //                ZStack{
        VStack{
            NavigationStack{
                VStack{
                    HStack{
                        Spacer()
                        //                        VStack{
                        Text("For You").foregroundStyle(sec ? .white : .gray)
                            .onTapGesture {
                                //                                        forYou = true
                                //                                        followed = false
                                sec = true
                            }
                        //                        }
                        
                        Spacer()
                        Text("Following").foregroundStyle(sec ? .gray : .white)
                            .onTapGesture {
                                //                                    followed = true
                                //                                    forYou = false
                                sec = false
                            }
                        Spacer()
                        
                    }
                    .padding(.top, 8)
                    Rectangle()
                        .foregroundStyle(.blue)
                        .frame(width: sec ? 65 : 80, height: 3)
                        .offset(CGSize(width: sec ? -80.0 : 71.5, height: 0.0))
                        .animation(.default, value: sec )
                    Divider()
                        .padding(.top, -8)
                    
                    Spacer()
                    ZStack{
                        ScrollView{
                            VStack{
                                if sec == true{
                                    //Text("Contenuto per te")
                                    VStack(alignment: .leading) {
                                        ForEach(tweets.reversed()){tweet in
                                            if tweet.type == true{
                                                NavigationLink(destination: TweetScreen(tweet: tweet, contr: true)){
                                                    HStack{
                                                        Image(systemName: "person.crop.circle")
                                                            .resizable()
                                                            .frame(width: 30, height: 30)
                                                            .padding(.leading, 25)
                                                            .padding(.trailing, 10)
                                                            .padding(.bottom, 10)
                                                        Text(tweet.text)
                                                            .padding(.bottom, 10)
//                                                        if ((tweet.image?.isEmpty) != nil){
//                                                            let uiImage = UIImage(data: tweet.image ?? Data())
//                                                            Image(uiImage:  uiImage ?? uiImage!)
//                                                                .resizable()
//                                                                .scaledToFit()
//                                                        }
                                                    }
                                                    .padding(.top, 10)
                                                }
                                                .buttonStyle(PlainButtonStyle())
                                            }
                                        }
                                        Divider()
                                        
                                        if !tweets.isEmpty, let firstTweet = tweets.first, firstTweet != nil {
//                                            ForEach(activity.tweets){ twee in
                                                
//                                                if twee.type == true {
//                                                    NavigationLink(destination: TweetScreen(tweet: tweets[0], tweet2: twee, contr: false)){
//                                                        HStack{
//                                                            Image(systemName: "person.crop.circle")
//                                                                .resizable()
//                                                                .frame(width: 30, height: 30)
//                                                                .padding(.leading, 25)
//                                                                .padding(.trailing, 10)
//                                                                .padding(.bottom, 10)
//                                                            Text(twee.text)
//                                                                .padding(.bottom, 10)
//                                                                .fixedSize(horizontal: false, vertical: true)
//                                                        }
//                                                        .padding(.top, 10)
//                                                        Divider()
//                                                        
//                                                    }
//                                                    .buttonStyle(PlainButtonStyle())
//                                                }
//                                            }
                                        }else{
                                            VStack{
                                                EmptyView()
                                            }.onAppear{
                                                let newTweet1 = Tweet(nickname: "Apple Education", text: "At Istituto Comprensivo Statale G. Ungaretti, Professional Learning is not about teachers doing it alone. With iPad, educators share their experiences and learn together, creating a fun environment that’s transforming how they teach.", image: nil, type: true)
                                                context.insert(newTweet1)
                                                let newTweet2 = Tweet(nickname: "Apple Education", text: "Announcing the Swift Student Challenge 2024! \n \nNew resources make it even easier for students to prepare for the Challenge and get inspired to build incredible apps with the free Swift Playgrounds app on iPad and Mac", image: nil, type: true)
                                                context.insert(newTweet2)
                                                let newTweet3 = Tweet(nickname: "Apple Education", text: "Learning to build apps can help students  tackle some of the worlds’ biggest problems. \n \nWe’re excited to announce the Swift Student Challenge 2024 with new resources designed to help your students get started.", image: nil, type: false)
                                                context.insert(newTweet3)
                                            }
                                        }
                                    }
                                    
                                }else{
                                    ForEach(tweets.reversed()){tweet in
                                        if tweet.type == false{
                                            NavigationLink(destination: TweetScreen(tweet: tweet, contr: true)){
                                                HStack{
                                                    Image(systemName: "person.crop.circle")
                                                        .resizable()
                                                        .frame(width: 30, height: 30)
                                                        .padding(.leading, 25)
                                                        .padding(.trailing, 10)
                                                        .padding(.bottom, 10)
                                                    Text(tweet.text)
                                                        .padding(.bottom, 10)
                                                }
                                                .padding(.top, 10)
                                            }
                                            .buttonStyle(PlainButtonStyle())
                                        }
                                    }
                                    Divider()
                                }
                            }.frame(maxWidth: .infinity, alignment: .leading)
                            Spacer()
                        }
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    dragOffset = value.translation.width
                                    controlHeight = value.translation.height
                                    print(controlHeight)
                                    //print(dragOffset)
                                    if controlHeight < 6 && controlHeight > -6 {
                                        if dragOffset < 0{
                                            sec = false
                                        }else{
                                            sec = true
                                        }
                                    }
                                }
                        )
                        //.zIndex(1)
                        VStack{
                            Button(action: {
                                isModalPresented.toggle()
                                
                            }, label: {
                                ZStack{
                                    Circle()
                                        .frame(width: 60)
                                    Image(systemName: "plus")
                                        .foregroundStyle(.white)
                                }
                            }).frame(maxWidth: .infinity, maxHeight: .infinity ,alignment: .bottomTrailing)
                                .padding(.trailing, 20)
                                .padding(.bottom, 10)
                            //  .zIndex(2)
                                .sheet(isPresented: $isModalPresented, content: {
//                                    Twitt(isPresented: $isModalPresented)
                                    SecondTwitt(isPresented: $isModalPresented)
                                })
                        }
                    }
                    Divider()
                    
                    
                }
                .navigationBarTitle("", displayMode: .inline)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        HStack {
                            Button(action: {
                                print("Account button tapped!")
                            }) {
                                Image(systemName: "person.crop.circle")
                                    .foregroundStyle(.white)
                            }.padding()
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Image("logo-x-twitter")
                                .resizable()
                                .frame(width: 25, height: 25, alignment: .topLeading)
                            
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack {
                            
                            Button(action: {
                                print("Info button tapped!")
                            }) {
                                Image(systemName: "gearshape")
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                    
                    // bottom toolbar
                    ToolbarItem(placement: .bottomBar){
                        HStack {
                            Button(action: {
                                print("Home button tapped!")
                            }) {
                                Image(systemName: "house")
                                    .foregroundStyle(.white)
                            }.padding(10)
                            
                            Button(action: {
                                print("Search button tapped!")
                            }) {
                                Image(systemName: "magnifyingglass")
                                    .foregroundStyle(.white)
                            }.padding(10)
                            
                            Button(action: {
                                print("Communities button tapped!")
                            }) {
                                Image(systemName: "person.2")
                                    .foregroundStyle(.white)
                            }.padding(10)
                            
                            Button(action: {
                                print("Notifications button tapped!")
                            }) {
                                Image(systemName: "bell")
                                    .foregroundStyle(.white)
                            }.padding(10)
                            
                            Button(action: {
                                print("Message button tapped!")
                            }) {
                                Image(systemName: "envelope")
                                    .foregroundStyle(.white)
                            }.padding(10)
                        }
                    }
                })
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    FirstScreen()
}
