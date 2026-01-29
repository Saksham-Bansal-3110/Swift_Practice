//
//  TextEditorToolBar.swift
//  NavigationBarSession
//
//  Created by GU on 29/01/26.
//

import SwiftUI

struct TextEditorToolBar: View {
    @State var text = "Sample Text"
    @State var size : CGFloat = 14
    @State var isBold  = false
    @State var isItalic = false
    @State var isUnderLined = false
    
    var body: some View {
        NavigationStack{
            VStack{
                TextEditor(text: $text)
                    .font(.system(size: size))
                    .italic(isItalic)
                    .bold(isBold)
                    .underline(isUnderLined)
                
                Text(text)
                    .font(.system(size: size))
                    .italic(isItalic)
                    .bold(isBold)
                    .underline(isUnderLined)
                    
            }
            .padding()
            .navigationTitle("Note")
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing){
                    
                    Slider(value: $size, in: 8...40){
                        Text("Font Size")
                    }
                    .frame(width: 120)
                    
                    Toggle(isOn: $isBold){
                        Image(systemName: "bold")
                    }
                    .toggleStyle(.button)
                    
                    Toggle(isOn: $isItalic){
                        Image(systemName: "italic")
                    }
                    .toggleStyle(.button)
                    
                    Toggle(isOn: $isUnderLined){
                        Image(systemName: "underline.double")
                    }
                    .toggleStyle(.button)
                }
            }
        }
    }
}

#Preview {
    TextEditorToolBar()
}
