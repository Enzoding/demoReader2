//
//  ReadingNoteView.swift
//  demoReader2
//
//  Created by 龙龙 on 2024/7/21.
//

import SwiftUI
import BetterSafariView

struct ReadingNoteView: View {
    @State private var presentingSafariView = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                HStack {
                    Link(destination: URL(string: "https://peaceding.top/")!) {
                        RoundButtonView(text: "在Safari打开", image: "safari")
                    }
                    Button(action: {
                        self.presentingSafariView = true
                    }) {
                        RoundButtonView(text: "本应用中打开", image: "star")
                    }
                    .safariView(isPresented: $presentingSafariView){
                        SafariView(
                            url: URL(string: "https://peaceding.top/")!,
                        configuration: SafariView.Configuration(
                            entersReaderIfAvailable: true,
                            barCollapsingEnabled: true
                            )
                        )
                        .preferredBarAccentColor(.clear)
                        .preferredControlAccentColor(.orange)
                        .dismissButtonStyle(.close)
                    }
                }
                
                Spacer()
                
            }
            .navigationTitle("笔记")
        }
    }
}

#Preview {
    ReadingNoteView()
}
