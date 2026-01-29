//
//  PhotoAlbumDesign.swift
//  NavigationBarSession
//
//  Created by GU on 29/01/26.
//

import SwiftUI

struct Photo : Identifiable, Hashable {
    let id = UUID()
    let icon : String
    let description : String
}

struct PhotoAlbumDesign: View {
    let photos : [Photo] = [
        Photo(icon: "Image", description: "Sunset BeachSide Painting"),
        Photo(icon: "Image 1", description: "Morning Mountion Painting"),
        Photo(icon: "Image 2", description: "Sunset Valley Painting"),
        Photo(icon: "Image 3", description: "Sunset Sea Painting")
    ]
    
    @State private var selectedImages : Set<Photo> = []
    
    @State private var selectMode : Bool = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(photos) { photo in
                    NavigationLink{
                        PhotoDetailView(photo: photo)
                    } label: {
                        PhotoView(photo: photo, isSelected: selectedImages.contains(photo))
                            .onTapGesture {
                                if selectMode {
                                    if selectedImages.contains(photo) {
                                        selectedImages.remove(photo)
                                    }
                                    else {
                                        selectedImages.insert(photo)
                                    }
                                }
                            }
                    }
                }
            }
            .navigationTitle("Photo Album")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        selectMode.toggle()
                        selectedImages.removeAll()
                    } label: {
                        Text(selectMode ? "Cancel" : "Select")
                    }
                }
                ToolbarItemGroup(placement: .bottomBar){
                    Button{
                        
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    .disabled(selectedImages.isEmpty)
                    
                    Button{
                        
                    } label: {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                    .disabled(selectedImages.isEmpty)
                }
            }
        }
    }
}

struct PhotoView : View {
    let photo : Photo
    var isSelected : Bool
    
    var body : some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading){
                Image(photo.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .foregroundStyle(.blue)
            }
            Image(systemName: isSelected ? "checkmark.circle.fill"  : "circle")
                .font(.largeTitle)
                .foregroundStyle(isSelected ? .blue : .black)
                .offset(x: 40)
        }
    }
}

struct PhotoDetailView : View {
    let photo : Photo
    
    var body : some View {
        VStack{
            Image(photo.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 300)
                .foregroundStyle(.blue)
            Text(photo.description)
        }
        .navigationTitle("Photo Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    PhotoAlbumDesign()
}

