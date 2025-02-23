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
    func fetchNews() {
        
    }
}
