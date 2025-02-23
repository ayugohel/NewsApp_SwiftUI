//
//  ContentView.swift
//  NewsApp_iOS
//
//  Created by Ayushi Gohel on 2025-02-22.
//

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
                    Text(article.title)
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
