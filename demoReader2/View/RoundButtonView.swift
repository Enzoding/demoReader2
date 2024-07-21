//
//  RoundButtonView.swift
//  demoReader2
//
//  Created by 龙龙 on 2024/7/21.
//

import SwiftUI

struct RoundButtonView: View {
    let text: String
    let image: String
    
    var body: some View {
        HStack{
            Text(text)
            Image(systemName: image)
        }
        .font(.headline)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .foregroundColor(.white)
        .background(Color.accentColor)
        .cornerRadius(10)
        .shadow(radius: 3, x: 3.2)
        
    }
}

#Preview {
    RoundButtonView(text: "目的地", image: "circle")
}
