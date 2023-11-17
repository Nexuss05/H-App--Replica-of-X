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
    var activity = TweetViewModel()
    
    var body: some View {
        //        ZStack{
        VStack{
            NavigationStack{
                VStack{
                    HStack{
                        Spacer()
                        VStack{
                            Text("For You").foregroundStyle(sec ? .white : .gray)
                                .onTapGesture {
                                    //                                        forYou = true
                                    //                                        followed = false
                                    sec = true
                                }
                        }
                        
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
                        .offset(CGSize(width: sec ? -80.0 : 72.5, height: 0.0))
                        .animation(.default, value: sec )
                    Divider()
                        .padding(.top, -8)
                    
                    Spacer()
                    ScrollView{
                        VStack{
                            if sec == true{
                                //                                Text("Contenuto per te")
                                
                                VStack(alignment: .leading) {
                                    ForEach(tweets){tweet in
                                        HStack{
                                            Image(systemName: "person.crop.circle")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .padding(.leading, 25)
                                                .padding(.trailing, 10)
                                            Text(tweet.text)
                                                .padding(.bottom, 10)
                                        }
                                        .padding(.top, 10)
                                        Divider()
                                    }
                                    
                                    ForEach(activity.tweets){ twee in
                                        HStack{
                                            Image(systemName: "person.crop.circle")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .padding(.leading, 25)
                                                .padding(.trailing, 10)
                                            Text(twee.text)
                                                .padding(.bottom, 10)
                                                .fixedSize(horizontal: false, vertical: true)
                                        }
                                        .padding(.top, 10)
                                        Divider()
                                    }
                                }
                                
                            }else{
                                Text("Contenuto seguiti")
                            }
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                    }
                    
                    
                    Button(action: {
                        isModalPresented.toggle()
                        
                    }, label: {
                        ZStack{
                            Circle()
                                .frame(width: 60)
                            Image(systemName: "plus")
                                .foregroundStyle(.white)
                        }
                    }).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .padding(.trailing, 30)
                        .sheet(isPresented: $isModalPresented, content: {
                            Twitt(isPresented: $isModalPresented)
                        })
                    
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
                })
            }
        }
        //        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    FirstScreen()
}
