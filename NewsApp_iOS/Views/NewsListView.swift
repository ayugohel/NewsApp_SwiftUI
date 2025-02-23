//
//  ContentView.swift
//  NewsApp_iOS
//
//  Created by Ayushi Gohel on 2025-02-22.
//

// MARK: Main view displaying news articles.

import SwiftUI

struct NewsListView: View {
    @StateObject private var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                List(viewModel.articles) { article in
                    NavigationLink(destination: ArticleDetailView(article: article)) {
                        NewsCell(article: article)
                    }
                }
                
                .navigationTitle("Latest News")
                .onAppear {
                    viewModel.fetchNews()
                }
            }
        }
    }
}

#Preview {
    NewsListView()
}
