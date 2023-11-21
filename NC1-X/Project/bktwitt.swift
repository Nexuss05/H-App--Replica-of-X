////
////  Twitt.swift
////  NC1-X
////
////  Created by Matteo Cotena on 16/11/23.
////
//
//import SwiftUI
//import SwiftData
//
//struct Twitt: View {
//    @Environment(\.modelContext) var context
//    @Query var tweets: [Tweet] = []
//    @Binding var isPresented: Bool
//    @State private var text = ""
//    @State private var image: Image?
//    
//    
//    
//    var body: some View {
//        NavigationView {
//            HStack{
//                ScrollView{
//                    VStack{
//                        HStack{
//                            Image(systemName: "person.crop.circle")
//                                .resizable()
//                                .frame(width: 30, height: 30)
//                                .padding(.leading, 25)
//                                .padding(.trailing, 10)
//                                TextField("What's happening?", text: $text, axis: .vertical)
//                                    .padding()
//                        }
//                        .padding(.top, 10)
//                    }
//                    .keyboardAdaptive()
//                    
//                    
//                }
//            }
////            .offset(y: -UIScreen.screenHeight/1.22)
//            //            .padding(.bottom, 600)
//            
//            .navigationBarTitle("", displayMode: .inline)
//            .navigationBarItems(
//                leading: Button("Cancel") {
//                    isPresented = false
//                },
//                trailing: Button("Post") {
//                    isPresented = false
//                    let newTweet = Tweet(nickname: "mario", text: text, type: true)
//                    context.insert(newTweet)
//                }
//                    .font(.system(size: 15))
//                    .foregroundColor(.white)
//                    .padding(.trailing, 16)
//                    .padding(.leading, 8)
//                    .padding(.top, 4)
//                    .padding(.bottom, 4)
//                    .background(.blue)
//                    .cornerRadius(20)
//                
//            )
//            
//        }
//        .preferredColorScheme(.dark)
//    }
//}
//
//extension View {
//    func keyboardAdaptive() -> some View {
//        ModifiedContent(
//            content: self,
//            modifier: KeyboardAdaptiveModifier()
//        )
//    }
//}
//
//struct KeyboardAdaptiveModifier: ViewModifier {
//    @State private var offset: CGFloat = 0
//    
//    func body(content: Content) -> some View {
//        content
//            .padding(.bottom, offset)
//            .onAppear {
//                NotificationCenter.default.addObserver(
//                    forName: UIResponder.keyboardWillShowNotification,
//                    object: nil,
//                    queue: .main
//                ) { notification in
//                    guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
//                    let height = value.height
//                    offset = height
//                }
//                
//                NotificationCenter.default.addObserver(
//                    forName: UIResponder.keyboardWillHideNotification,
//                    object: nil,
//                    queue: .main
//                ) { _ in
//                    offset = 0
//                }
//            }
//    }
//}
//
//#Preview {
//    FirstScreen()
//}
