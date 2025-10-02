//
//  DetailView.swift
//  HAXOR News
//
//  Created by Chukwuebuka Ezepue on 02/10/2025.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    let post: Post
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Article header
                VStack(alignment: .leading, spacing: 12) {
                    Text(post.title ?? "No Title")
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    
                    HStack {
                        Label("\(post.points ?? 0) points", systemImage: "arrow.up")
                            .font(.caption)
                            .foregroundColor(.orange)
                        
                        Spacer()
                        
                        if let urlString = url, let domain = URL(string: urlString)?.host {
                            Text(domain)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color(.separator)),
                    alignment: .bottom
                )
                
                // WebView
                if let urlString = url {
                    WebView(urlString: urlString)
                } else {
                    ContentUnavailableView(
                        "No URL Available",
                        systemImage: "link.badge.plus",
                        description: Text("This story doesn't have a web link")
                    )
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if let urlString = url {
                    ShareLink(item: URL(string: urlString)!) {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
    }
}

#Preview {
    DetailView(url: "https://www.google.com", post: Post(objectID: "1", points: 100, title: "Sample Post", url: "https://www.google.com", createdAt: "2025-01-02T10:00:00Z"))
}
