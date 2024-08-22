//
//  CachedAsyncImage.swift
//  National Park Service
//
//  Created by Lorenzo Pantano on 22/08/24.
//

import SwiftUI

struct CachedAsyncImage: View {
    @StateObject private var imageLoader = ImageLoader()
    let url: String

    @State private var placeholderOpacity: Double = 0.3

    var body: some View {
        Group {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
            } else {
                Color.gray
                    .opacity(placeholderOpacity)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true)) {
                            placeholderOpacity = 0.6
                        }
                        imageLoader.loadImage(from: url)
                    }
            }
        }
        .onDisappear {
            imageLoader.cancel()
        }
    }
}

#Preview {
    CachedAsyncImage(url: NPS_BASE_URL + TETON_IMAGE)
}
