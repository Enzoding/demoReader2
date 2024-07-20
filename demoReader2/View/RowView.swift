//
//  Row.swift
//  demoReader2
//
//  Created by 龙龙 on 2024/7/18.
//

import SwiftUI

struct RowView: View {
    var article: Article
    
    var body: some View {
        VStack(alignment: .listRowSeparatorLeading){
            Text(article.title)
                .font(.title3)
                .bold()
                .padding(.bottom, 2)
            Text(article.body)
                .lineLimit(5)
            }
        }
    }

// 删除了Row的预览，感觉不需要；

#Preview {
    RowView(article: Article(id: 2, title: "title", body: "body"))
}
