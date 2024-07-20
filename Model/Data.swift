//
//  File.swift
//  demoReader2
//
//  Created by 龙龙 on 2024/7/18.
//

import Foundation

// MARK: -Model
struct Article: Codable, Identifiable {
    var id: Int
    var title: String
    var body: String
}

// MARK: -ViewModel
// 传递给文章视图的是一个list，需要额外定义一个数组，这个新定义的类负责给其他视图来提供数据，在数据变更时通知其他视图更新；
class Data: ObservableObject {
    @Published var articles = [Article]()
    
    init(){
        guard let url = URL(string: "https://www.legolas.me/s/articles.json") else{
            print("Invalid URL")
            return
        }
        // 省略了报错，而选择强行拆包；
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            DispatchQueue.main.async {
                self.articles = try! JSONDecoder().decode([Article].self, from: data!)
            }
        }.resume()
    }
}
