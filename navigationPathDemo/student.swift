//
//  student.swift
//  navigationPathDemo
//
//  Created by GU on 23/01/26.
//

import Foundation

struct Stupident : Identifiable, Hashable {
    var id = UUID()
    var name : String
    var email : String
    var skills : [Skill]
}

class StupidentList {
    static var stupidents: [Stupident] = [
            Stupident(name: "Gintoki Sakata", email: "oddjobssakata69@gmail.com", skills: [
                Skill(name: "Slash", type: "Physical", icon: "stroke.line.diagonal.slash"),
                Skill(name: "Investigate", type: "Mind", icon: "brain.fill"),
                Skill(name: "Steal", type:"Dark", icon: "arrowshape.turn.up.left.circle")
            ]),
            Stupident(name: "Ichigo Kurosaki", email: "kurosakiichigo779@gmail.com", skills: [
                Skill(name: "Slash", type: "Physical", icon: "stroke.line.diagonal.slash"),
                Skill(name: "Tackle", type: "Physical", icon: "hand.raised.fill"),
            ]),
            Stupident(name: "Sherlock Holmes", email: "mrholmes765@gmail.com", skills: [
                Skill(name: "Investigate", type: "Mind", icon: "brain.fill"),
                Skill(name: "Steal", type:"Dark", icon: "arrowshape.turn.up.left.circle")
            ])
        ]
}

struct Skill : Identifiable, Hashable {
    var id = UUID()
    var name : String
    var type : String
    var icon : String
}

class SkillSet {
    static var skills: [Skill] = [
            Skill(name: "Slash", type: "Physical", icon: "stroke.line.diagonal.slash"),
            Skill(name: "Tackle", type: "Physical", icon: "hand.raised.fill"),
            Skill(name: "Investigate", type: "Mind", icon: "brain.fill"),
            Skill(name: "Steal", type:"Dark", icon: "arrowshape.turn.up.left.circle")
        ]
}
