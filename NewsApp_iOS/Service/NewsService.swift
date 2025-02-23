//
//  NewsService.swift
//  NewsApp_iOS
//
//  Created by Ayushi Gohel on 2025-02-22.
//

import Foundation
import Combine
import SwiftUI

enum NewsError: Error, LocalizedError {
    case invalidURL
    case requestFailed
    case decodingFailed
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL. Please try again later."
        case .requestFailed: return "Failed to fetch news. Check your internet connection."
        case .decodingFailed: return "Failed to process news data. Please try again later."
        }
    }
}

class NewsService {
    func fetchNews() -> AnyPublisher<[NewsArticle], NewsError> {
        let apiKey = "b03faa0715d54409af5127163cbd0609"
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: NewsError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError { _ in NewsError.requestFailed }
            .map { $0.data }
            .decode(type: NewsResponse.self, decoder: JSONDecoder())
            .map { $0.articles }
            .mapError { _ in NewsError.decodingFailed }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
