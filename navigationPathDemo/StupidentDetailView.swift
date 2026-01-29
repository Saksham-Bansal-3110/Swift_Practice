//
//  StupidentDetailView.swift
//  navigationPathDemo
//
//  Created by GU on 23/01/26.
//

import SwiftUI

struct StupidentDetailView: View {
    @Binding var path : NavigationPath
    let stupident : Stupident
    var body: some View {
        List{
            Section("Stupident Info"){
                VStack(alignment: .center){
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 100))
                    Text(stupident.name)
                        .font(.title2)
                    Text(stupident.email)
                        .font(.subheadline)
                        .fontWeight(.light)
                        .padding(.bottom, 30)
                }
                .padding(.leading, 70)
            }
            Section("Skills"){
                ForEach(stupident.skills) { skill in
                    Button {
                        path.append(skill)
                    } label: {
                        Label(skill.name, systemImage: skill.icon)
                    }
                }
            }
        }
        .navigationTitle(Text("Stupident ID"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: Skill.self, destination: { skill in
            SkillDetailView(path: $path, skill: skill)
        })
    }
}

#Preview {
    @Previewable @State var path = NavigationPath()
    StupidentDetailView(path: $path, stupident: StupidentList.stupidents[0])
}
