//
//  demoReader2App.swift
//  demoReader2
//
//  Created by 龙龙 on 2024/7/18.
//

import SwiftUI

@main
struct demoReader2App: App {
    // let motionManager = MotionManager()
    
    var body: some Scene {
        WindowGroup {
            TabView{
                MasterView()
                    .tabItem {
                        Label("阅读列表", systemImage: "books.vertical")
                    }
                ReadingNoteView()
                    .tabItem {
                        Label("笔记", systemImage: "note.text")
                    }
            }
        }
    }
}
