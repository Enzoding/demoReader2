//
//  Row.swift
//  demoReader2
//
//  Created by 龙龙 on 2024/7/18.
//

import SwiftUI

struct RowView: View {
    var article: Article
  //  @EnvironmentObject var motion: MotionManager
    
    var body: some View {
        VStack(alignment: .listRowSeparatorLeading){
            Text(article.title)
                .font(.title3)
                .bold()
                .padding(.bottom, 2)
   //             .scaleEffect(max(0.7, -motion.y*1.2))
            Text(article.body)
                .lineLimit(5)
  //              .scaleEffect(max(0.7, -motion.y*1.05))
            }
        }
    }

// 删除了Row的预览，感觉不需要；

#Preview {
    RowView(article: Article(id: 2, title: "title", body: "body"))
}
