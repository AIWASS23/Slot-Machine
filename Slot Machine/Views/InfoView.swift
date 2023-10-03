//
//  InfoView.swift
//  Slot Machine
//
//  Created by Marcelo de Araújo on 03/10/2023.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            LogoView()
            
            Spacer()
            
            Form {
                Section(header: Text("About the application")) {
                    FormRowView(firstItem: "Application", secondItem: "Slot Machine")
                    FormRowView(firstItem: "Platforms", secondItem: "iPhone, iPad, Mac")
                    FormRowView(firstItem: "Developer", secondItem: "Marcelo de Araújo")
                } 
            }
            .font(.system(.body, design: .rounded))
        }
        .padding(.top, 40)
        .overlay(
            Button(action: {
                audioPlayer?.stop()
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle")
                    .font(.title)
            }
                .padding(.top, 30)
                .padding(.trailing, 20)
                .accentColor(Color.secondary), alignment: .topTrailing)
        .onAppear {
            playSound(sound: "background-music", type: "mp3")
        }
    }
}

struct FormRowView: View {
    
    var firstItem: String
    var secondItem: String
    
    var body: some View {
        HStack {
            Text(firstItem)
                .foregroundColor(.gray)
            Spacer()
            Text(secondItem)
        }
    }
}


#Preview {
    InfoView()
}
