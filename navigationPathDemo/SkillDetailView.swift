//
//  SkillDetailView.swift
//  navigationPathDemo
//
//  Created by GU on 23/01/26.
//

import SwiftUI

struct SkillDetailView: View {
    @Binding var path : NavigationPath
    var skill : Skill
    var body: some View {
        VStack{
            Image(systemName: skill.icon)
                .font(.system(size: 100))
            Text(skill.name)
                .font(.title)
                .bold()
            Text(skill.type)
                .font(.subheadline)
                .fontWeight(.light)
            
            Button("Go back one screen"){
                path.removeLast()
            }
            .buttonStyle(.borderedProminent)
            
            Button("Go to Home"){
                path.removeLast(path.count)
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Skill Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

#Preview {
    @Previewable @State var path = NavigationPath()
    SkillDetailView(path: $path, skill: Skill(name: "Slash", type: "Physical", icon: "stroke.line.diagonal.slash"))
}
