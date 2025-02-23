//
//  NewsCell.swift
//  NewsApp_iOS
//
//  Created by Ayushi Gohel on 2025-02-22.
//

// MARK: UI component for displaying article preview.

import SwiftUI

struct NewsCell: View {
    let article: NewsArticle
    
    var body: some View {
        HStack {
            if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipped()
                        .cornerRadius(8)
                } placeholder: {
                    ProgressView()
                        .frame(width: 100, height: 100)
                }
            }
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.headline)
                    .lineLimit(2)
                Text(article.description ?? "No description available")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                Text("Published: \(article.formattedDate)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 5)
    }
}
