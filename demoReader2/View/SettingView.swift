//
//  SettingView.swift
//  demoReader2
//
//  Created by 龙龙 on 2024/7/20.
//

import SwiftUI

struct SettingView: View {
    @Binding var darkMode : Bool
    
    var body: some View {
        Button(action:{
            darkMode.toggle()
        }){
            Image(systemName: darkMode ? "sun.max.fill" : "moon.fill")
        }
    }
}

#Preview {
    // 恒定为假的绑定变量用于测试
    SettingView(darkMode: .constant(false))
}
