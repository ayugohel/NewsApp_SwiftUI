//
//  NewsViewModel.swift
//  NewsApp_iOS
//
//  Created by Ayushi Gohel on 2025-02-22.
//

// MARK: Manages state and business logic.

import SwiftUI
import Combine

class NewsViewModel: ObservableObject {
    
    @Published var articles: [NewsArticle] = []
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    private let newsService = NewsService()
    
    func fetchNews() {
        newsService.fetchNews()
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] articles in
                self?.articles = articles
            })
            .store(in: &cancellables)
    }
}
