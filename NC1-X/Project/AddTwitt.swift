////
////  AddTwitt.swift
////  NC1-X
////
////  Created by Matteo Cotena on 16/11/23.
////
//
//import Foundation
//import SwiftUI
//import SwiftData
//import PhotosUI
//
//struct AddTwitt: View{
//    
//    @State var selectedCategory: Category?
//    @State var selectedPhoto: PhotosPickerItem?
//    
//    
//    var body: some View{
//        Form{
////            Image($tweet.icon)
//            TextField("What's new?", text: $tweet.text)
//            
//            if let selectedPhotoData = tweet.image,
//               let uiImage = UIImage(data: selectedPhotoData) {
//                Image(uiImage: uiImage)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(maxWidth: .infinity, maxHeight: 300)
//            }
//            
//            PhotosPicker(selection: $selectedPhoto,
//                         matching: .images,
//                         photoLibrary: .shared()) {
//                Label("Add Image", systemImage: "photo")
//            }
//            
//            if tweet.image != nil {
//                
//                Button(role: .destructive) {
//                    withAnimation {
//                        selectedPhoto = nil
//                        tweet.image = nil
//                    }
//                } label: {
//                    Label("Remove Image", systemImage: "xmark")
//                        .foregroundStyle(.red)
//                }
//            }
//
//            
//        }
//        .task(id: selectedPhoto) {
//            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
//                tweet.image = data
//            }
//        }
//    }
//}
