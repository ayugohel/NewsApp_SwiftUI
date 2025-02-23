//
//  ArticleDetailView.swift
//  NewsApp_iOS
//
//  Created by Ayushi Gohel on 2025-02-22.
//

// MARK: Detailed view of a selected article.

import SwiftUI

struct ArticleDetailView: View {
    let article: NewsArticle
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                Text(article.title)
                    .font(.title)
                    .bold()
                Text("Source: \(article.source.name)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Published: \(article.formattedDate)")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(article.description ?? "No additional details available")
                    .font(.body)
                
                Link("Read Full Article", destination: URL(string: article.url)!)
                    .font(.headline)
                    .foregroundColor(.blue)
                Spacer()
            }
            .padding()
        }
        .onAppear {
            // Handle any additional setup when the view appears
        }
        .onDisappear {
            // Handle any cleanup when the view disappears
        }
    }
}
