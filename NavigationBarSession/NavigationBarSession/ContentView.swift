//
//  ContentView.swift
//  NavigationBarSession
//
//  Created by GU on 29/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List{
                NavigationLink("Buy Grocery"){
                    DetailView(title: "Grocery")
                }
                Text("Prepare Lecture Notes")
                Text("Reply to emails")
            }
            .navigationTitle("Reminders")
            //.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "sidebar.left")
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItemGroup(placement: .bottomBar){
                    Button {
                        
                    } label: {
                        Label("New Reminder", systemImage: "plus.circle.fill")
                    }
                    
                    Button {
                        
                    } label: {
                        Label("List", systemImage: "list.bullet")
                    }
                }
            }
//            .toolbarColorScheme(.none, for: .navigationBar)
//            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
//            .toolbarBackground(.blue, for: .navigationBar)
        }
    }
}

struct DetailView : View {
    let title : String
    @Environment(\.dismiss) private var dismiss
    var body : some View {
        List {
            Text(title)
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button{
                    dismiss()
                } label: {
//                    Label("Reminder", systemImage: "chevron.left")
//                        .labelStyle(.titleAndIcon)
                    HStack{
                        Image(systemName: "chevron.left")
                        Text("Reminders")
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
