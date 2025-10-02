//
//  ModernEmptyStateView.swift
//  HAXOR News
//
//  Created by Chukwuebuka Ezepue on 02/10/2025.
//

import SwiftUI

struct ModernEmptyStateView: View {
    let onRetry: () -> Void

    var body: some View {
        VStack(spacing: 24) {
            // Large icon with subtle animation
            Image(systemName: "newspaper.circle")
                .font(.system(size: 64, weight: .light))
                .foregroundColor(.orange)
                .symbolEffect(.pulse.byLayer, isActive: true)

            VStack(spacing: 12) {
                Text("No Stories Found")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.primary)

                Text("Check your connection and try again")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
            }

            Button(action: onRetry) {
                HStack(spacing: 8) {
                    Image(systemName: "arrow.clockwise")
                        .font(.system(size: 14, weight: .medium))
                    Text("Retry")
                        .font(.system(size: 16, weight: .semibold))
                }
                .foregroundColor(.white)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(
                    Capsule()
                        .fill(Color.orange)
                )
            }
            .buttonStyle(ScaleButtonStyle())
        }
        .padding(40)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

#Preview {
    ModernEmptyStateView {
        print("Retry tapped")
    }
}
