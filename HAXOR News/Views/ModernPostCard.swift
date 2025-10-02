//
//  ModernPostCard.swift
//  HAXOR News
//
//  Created by Chukwuebuka Ezepue on 02/10/2025.
//

import SwiftUI

struct ModernPostCard: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header with points and time
            HStack {
                // Points badge with modern design
                HStack(spacing: 4) {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.system(size: 14))
                        .foregroundColor(.orange)
                    Text("\(post.points ?? 0)")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.orange)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(
                    Capsule()
                        .fill(Color.orange.opacity(0.1))
                )
                
                Spacer()
                
                // Time ago with modern styling
                if let createdAt = post.createdAt {
                    HStack(spacing: 4) {
                        Image(systemName: "clock")
                            .font(.system(size: 11))
                        Text(timeAgo(from: createdAt))
                            .font(.system(size: 12, weight: .medium))
                    }
                    .foregroundColor(.secondary)
                }
            }
            
            // Title with improved typography
            Text(post.title ?? "No Title")
                .font(.system(size: 17, weight: .semibold, design: .default))
                .lineLimit(3)
                .multilineTextAlignment(.leading)
                .foregroundColor(.primary)
            
            // URL domain with icon
            if let urlString = post.url, let url = URL(string: urlString) {
                HStack(spacing: 6) {
                    Image(systemName: "link.circle")
                        .font(.system(size: 12))
                        .foregroundColor(.orange)
                    Text(url.host ?? "")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.secondary)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
        )
        .padding(.horizontal, 20)
        .padding(.vertical, 6)
    }
    
    private func timeAgo(from dateString: String) -> String {
        let formatter = ISO8601DateFormatter()
        guard let date = formatter.date(from: dateString) else { return "" }
        
        let now = Date()
        let timeInterval = now.timeIntervalSince(date)
        
        if timeInterval < 3600 {
            return "\(Int(timeInterval / 60))m"
        } else if timeInterval < 86400 {
            return "\(Int(timeInterval / 3600))h"
        } else {
            return "\(Int(timeInterval / 86400))d"
        }
    }
}

#Preview {
    ModernPostCard(post: Post(
        objectID: "1",
        points: 100,
        title: "Sample Post Title That Could Be Long",
        url: "https://www.example.com",
        createdAt: "2025-01-02T10:00:00Z"
    ))
    .padding()
}
