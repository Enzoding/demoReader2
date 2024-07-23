//
//  ContentView.swift
//  demoReader2
//
//  Created by 龙龙 on 2024/7/18.
//

import SwiftUI

// MARK: -View
struct MasterView: View {
    // 新增状态对象，初始化Data并让SwiftUI来管理存储
    @StateObject var data = TabReadingData()
    @AppStorage("darkMode") var darkMode = false
    
    var body: some View {
        NavigationView{
            List(data.articles) {
                article in
                NavigationLink(destination: DetailView(article: article)){
                    RowView(article: article)
                }
            }
            .navigationTitle("编辑推荐")
            .toolbar{
                SettingView(darkMode: $darkMode)
            }
        }
        // 主视图及子视图都会共用这个颜色方案
        .preferredColorScheme(darkMode ? .dark : .light)
        
    }
}

#Preview {
    MasterView()
}
