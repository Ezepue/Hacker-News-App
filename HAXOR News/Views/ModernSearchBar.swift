//
//  ModernSearchBar.swift
//  HAXOR News
//
//  Created by Chukwuebuka Ezepue on 02/10/2025.
//

import SwiftUI

struct ModernSearchBar: View {
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            HStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(isFocused ? .orange : .secondary)
                    .font(.system(size: 16, weight: .medium))
                
                TextField("Search stories...", text: $text)
                    .focused($isFocused)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.system(size: 16))
                
                if !text.isEmpty {
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            text = ""
                        }
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.secondary)
                            .font(.system(size: 16))
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBackground))
                    .shadow(
                        color: isFocused ? .orange.opacity(0.3) : .black.opacity(0.1),
                        radius: isFocused ? 8 : 4,
                        y: 2
                    )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isFocused ? Color.orange : Color.clear, lineWidth: 2)
            )
        }
        .padding(.horizontal, 20)
        .animation(.easeInOut(duration: 0.2), value: isFocused)
    }
}

#Preview {
    ModernSearchBar(text: .constant(""))
}
