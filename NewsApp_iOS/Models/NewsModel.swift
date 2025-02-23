//
//  NewsModel.swift
//  NewsApp_iOS
//
//  Created by Ayushi Gohel on 2025-02-22.
//

import Foundation

struct NewsResponse: Decodable {
    let articles: [NewsArticle]
}

struct NewsArticle: Identifiable, Decodable {
    let id = UUID()
    let title: String
    let description: String?
    let source: Source
    let publishedAt: String
    let url: String
    let urlToImage: String?
    
    struct Source: Decodable {
        let name: String
    }
    
    enum CodingKeys: String, CodingKey {
        case title, description, source, publishedAt, url, urlToImage
    }
}
