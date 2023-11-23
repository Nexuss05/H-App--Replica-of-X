//
//  Twitt.swift
//  NC1-X
//
//  Created by Matteo Cotena on 16/11/23.
//

import SwiftUI
import SwiftData
import PhotosUI

struct SecondTwitt: View {
    @Environment(\.modelContext) var context
    @Query var tweets: [Tweet] = []
    @Binding var isPresented: Bool
    @State private var text = ""
    @State private var image: Data?
    
    @State var selectedPhoto: PhotosPickerItem?
    
    
    var body: some View {
        NavigationView {
            HStack{
                ScrollView{
                    VStack{
                        HStack{
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.leading, 25)
                                .padding(.trailing, 10)
                            TextField("What's happening?", text: $text, axis: .vertical)
                                .padding()
                        }
                        .padding(.top, 10)
                        VStack(alignment: .leading){
                            if let selectedPhotoData = image,
                               let uiImage = UIImage(data: selectedPhotoData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                //                                .frame(maxWidth: .infinity, maxHeight: 300)
                            }else{
                                PhotosPicker(selection: $selectedPhoto,
                                             matching: .images,
                                             photoLibrary: .shared()) {
                                    VStack{
                                        Label("", systemImage: "photo")
                                            .padding(.bottom, 5)
                                            .padding(.leading, 10)
                                            .foregroundStyle(.white)
                                        Text("Add Image")
                                            .foregroundStyle(.white)
                                    }
                                    .padding(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(.black, lineWidth: 1)
                                    )
                                    Spacer()
                                }
                                             .padding(.leading, 10)
                            }
                        }
                        if image != nil {
                            
                            Button(role: .destructive) {
                                //                                withAnimation {
                                selectedPhoto = nil
                                image = nil
                                //                                }
                            } label: {
                                Label("Remove Image", systemImage: "xmark")
                                    .foregroundStyle(.red)
                                    .padding(10)
                            }
                        }
                        
                        
                    }
                    .keyboardAdaptive()
                    
                    
                }
            }
            //            .offset(y: -UIScreen.screenHeight/1.22)
            //            .padding(.bottom, 600)
            
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    isPresented = false
                },
                trailing: Button("Post") {
                    isPresented = false
                    let newTweet = Tweet(nickname: "Matteo", text: text, image: image, type: true)
                    context.insert(newTweet)
                }
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                    .padding(.trailing, 16)
                    .padding(.leading, 8)
                    .padding(.top, 4)
                    .padding(.bottom, 4)
                    .background(.blue)
                    .cornerRadius(20)
                
            )
            .task(id: selectedPhoto) {
                if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                    image = data
                }
            }
            
        }
        .preferredColorScheme(.dark)
    }
}



//#Preview {
//    FirstScreen()
//}
