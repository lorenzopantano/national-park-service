//
//  ImageLoader.swift
//  National Park Service
//
//  Created by Lorenzo Pantano on 22/08/24.
//

import Foundation
import Combine
import SwiftUI


class ImageLoader: ObservableObject {
    @Published var image: UIImage?

    private var cache: NSCache<NSString, UIImage> = NSCache()
    private var cancellable: AnyCancellable?

    func loadImage(from url: String) {
        let cacheKey = NSString(string: url)
        if let cachedImage = cache.object(forKey: cacheKey) {
            self.image = cachedImage
            return
        }

        guard let imageURL = URL(string: url) else {
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: imageURL)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] loadedImage in
                guard let self = self, let loadedImage = loadedImage else { return }
                self.cache.setObject(loadedImage, forKey: cacheKey)
                self.image = loadedImage
            }
    }

    func cancel() {
        cancellable?.cancel()
    }
}
