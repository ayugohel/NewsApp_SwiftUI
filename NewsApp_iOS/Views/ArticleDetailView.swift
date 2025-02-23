//
//  ArticleDetailView.swift
//  NewsApp_iOS
//
//  Created by Ayushi Gohel on 2025-02-22.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: NewsArticle

    var body: some View {
        Text(article.title)
    }
}
