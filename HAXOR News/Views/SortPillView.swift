//
//  SortPillView.swift
//  HAXOR News
//
//  Created by Chukwuebuka Ezepue on 02/10/2025.
//

import SwiftUI

struct SortPillView: View {
    let option: ContentView.SortOption
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: option.icon)
                    .font(.system(size: 12, weight: .medium))
                Text(option.rawValue)
                    .font(.system(size: 14, weight: .medium))
            }
            .foregroundColor(isSelected ? .white : .primary)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(isSelected ? Color.orange : Color(.systemGray5))
            )
            .overlay(
                Capsule()
                    .stroke(isSelected ? Color.orange : Color.clear, lineWidth: 1)
            )
        }
        .scaleEffect(isSelected ? 1.05 : 1.0)
        .animation(.spring(response: 0.3), value: isSelected)
    }
}

#Preview {
    HStack {
        SortPillView(
            option: .popularity,
            isSelected: true,
            action: {}
        )
        SortPillView(
            option: .date,
            isSelected: false,
            action: {}
        )
        SortPillView(
            option: .points,
            isSelected: false,
            action: {}
        )
    }
    .padding()
}
