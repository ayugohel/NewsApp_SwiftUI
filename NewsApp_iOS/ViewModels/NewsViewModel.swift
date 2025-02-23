//
//  NewsViewModel.swift
//  NewsApp_iOS
//
//  Created by Ayushi Gohel on 2025-02-22.
//


import SwiftUI
import Combine

class NewsViewModel: ObservableObject {

    private var cancellables = Set<AnyCancellable>()
    private let newsService = NewsService()
    
    func fetchNews() {

    }
}
