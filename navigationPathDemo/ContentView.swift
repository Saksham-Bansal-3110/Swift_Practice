//
//  ContentView.swift
//  navigationPathDemo
//
//  Created by GU on 23/01/26.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    var stupidents : [Stupident] = StupidentList.stupidents
    var body: some View {
        NavigationStack(path : $path){
            List{
                Section("Stupidents"){
                    ForEach(stupidents) { stupident in
                        Button {
                            path.append(stupident)
                        } label: {
                            StupidentRowView(stupident: stupident)
                        }
                    }
                }
                Section("Navigation Info"){
                    Text("Navigation Path : \(path.count)")
                        .foregroundStyle(.teal)
                }
            }
            .navigationTitle("Stupident Portal")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Stupident.self, destination: { stupident in
                StupidentDetailView(path: $path, stupident: stupident)
            })
        }
    }
}

#Preview {
    ContentView()
}
