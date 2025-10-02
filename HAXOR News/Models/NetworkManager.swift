//
//  NetworkManager.swift
//  HAXOR News
//
//  Created by Chukwuebuka Ezepue on 02/10/2025.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func fetchData() {
        isLoading = true
        errorMessage = nil
        
        guard let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") else {
            isLoading = false
            errorMessage = "Invalid URL"
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                    return
                }
                
                guard let data = data else {
                    self?.errorMessage = "No data received"
                    return
                }
                
                do {
                    let response = try JSONDecoder().decode(NewsResponseObj.self, from: data)
                    self?.posts = response.hits
                } catch {
                    self?.errorMessage = "Failed to decode data: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
    
    @MainActor
    func refreshData() async {
        fetchData()
        while isLoading {
            try? await Task.sleep(nanoseconds: 100_000_000)
        }
    }
}
