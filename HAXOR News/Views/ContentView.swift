//
//  ContentView.swift
//  HAXOR News
//
//  Created by Chukwuebuka Ezepue on 02/10/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var networkManager = NetworkManager()
    @State private var searchText = ""
    @State private var selectedSortOption = SortOption.popularity

    enum SortOption: String, CaseIterable {
        case popularity = "Popular"
        case date = "Recent"
        case points = "Top Rated"

        var icon: String {
            switch self {
            case .popularity: return "flame"
            case .date: return "clock"
            case .points: return "star"
            }
        }
    }

    var filteredPosts: [Post] {
        let filtered = searchText.isEmpty ? networkManager.posts :
            networkManager.posts.filter { $0.title?.localizedCaseInsensitiveContains(searchText) ?? false }

        switch selectedSortOption {
        case .popularity:
            return filtered
        case .date:
            return filtered.sorted { ($0.createdAt ?? "") > ($1.createdAt ?? "") }
        case .points:
            return filtered.sorted { ($0.points ?? 0) > ($1.points ?? 0) }
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Modern Header with Gradient
                VStack(spacing: 16) {
                    // Search Bar
                    ModernSearchBar(text: $searchText)

                    // Sort Options with Pills Design
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(SortOption.allCases, id: \.self) { option in
                                SortPillView(
                                    option: option,
                                    isSelected: selectedSortOption == option
                                ) {
                                    withAnimation(.spring(response: 0.3)) {
                                        selectedSortOption = option
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .padding(.vertical, 16)
                .background(
                    LinearGradient(
                        colors: [Color.orange.opacity(0.1), Color.clear],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

                // Content Area
                if networkManager.isLoading && networkManager.posts.isEmpty {
                    ModernLoadingView()
                } else if networkManager.posts.isEmpty {
                    ModernEmptyStateView {
                        networkManager.fetchData()
                    }
                } else {
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(filteredPosts) { post in
                                NavigationLink(destination: DetailView(url: post.url, post: post)) {
                                    ModernPostCard(post: post)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    .refreshable {
                        await networkManager.refreshData()
                    }
                }

                Spacer()
            }
            .navigationTitle("HAXOR News")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation {
                            networkManager.fetchData()
                        }
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.orange)
                    }
                }
            }
        }
        .onAppear {
            if networkManager.posts.isEmpty {
                networkManager.fetchData()
            }
        }
    }
}

#Preview {
    ContentView()
}
