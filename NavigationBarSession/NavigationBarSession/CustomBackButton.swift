//
//  CustomBackButton.swift
//  NavigationBarSession
//
//  Created by GU on 29/01/26.
//

import SwiftUI

struct Note : Identifiable, Hashable {
    let id = UUID()
    let title : String
    let preview : String
}

struct CustomBackButton: View {
    let notes : [Note] = [
        Note(title: "Grocery List", preview: "Milk,Eggs,Bread"),
        Note(title: "Class Notes", preview: "SwiftUI,SpriteKit"),
        Note(title: "Meeting Notes", preview: "I am so done"),
        Note(title: "ToDo", preview: "Finish Assigment")
    ]
    
    @State private var selectedNote : Set<Note> = []
    
    @State private var selectMode : Bool = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(notes) { note in
                    NavigationLink{
                        NoteDetailView(note: note)
                    } label: {
                        NoteView(note: note, isSelected: selectedNote.contains(note))
                            .onTapGesture {
                                if selectMode {
                                    if selectedNote.contains(note) {
                                        selectedNote.remove(note)
                                    }
                                    else {
                                        selectedNote.insert(note)
                                    }
                                }
                            }
                    }
                }
            }
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        selectMode.toggle()
                        selectedNote.removeAll()
                    } label: {
                        Text(selectMode ? "Cancel" : "Select")
                    }
                }
                ToolbarItemGroup(placement: .bottomBar){
                    Button{
                        
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    .disabled(selectedNote.isEmpty)
                    
                    Button{
                        
                    } label: {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                    .disabled(selectedNote.isEmpty)
                }
            }
        }
    }
}

struct NoteView : View {
    let note : Note
    var isSelected : Bool
    
    var body : some View {
        HStack {
            VStack(alignment: .leading){
                Text(note.title)
                    .font(.headline)
                Text(note.preview)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            Image(systemName: isSelected ? "checkmark.circle.fill"  : "circle")
                .foregroundStyle(isSelected ? .blue : .black)
        }
    }
}

struct NoteDetailView : View {
    let note : Note
    
    var body : some View {
        VStack{
            Text(note.title)
            Text(note.preview)
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CustomBackButton()
}

