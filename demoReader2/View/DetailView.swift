//
//  DetailView.swift
//  demoReader2
//
//  Created by 龙龙 on 2024/7/20.
//

import SwiftUI

struct DetailView: View {
    var article: Article
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
//                Text(article.title)
//                    .font(.title3)
//                    .bold()
//                    .padding(.bottom, 2)
//                    .padding(.horizontal)
                Text(article.body)
                    .padding(.horizontal)
            }
        }
        .navigationTitle(article.title)
    }
}

#Preview {
    DetailView(article: Article(id: 1, title: "title", body: "body"))
}
