//
//  StupidentRowView.swift
//  navigationPathDemo
//
//  Created by GU on 23/01/26.
//

import SwiftUI

struct StupidentRowView: View {
    var stupident : Stupident
    var body: some View {
        HStack{
            Image(systemName: "person.circle")
                .font(.largeTitle)
            VStack(alignment: .leading){
                Text(stupident.name)
                Text(stupident.email)
            }
        }
    }
}

#Preview {
    StupidentRowView(stupident: Stupident(name: "Geroge Hinton", email: "hintonexar@gmail.com", skills: [Skill(name: "Slash", type: "Physical", icon: "sword")]))
}
