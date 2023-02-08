//
//  ImageLoader.swift
//  Pinterest
//
//  Created by Junho Lee on 2023/02/08.
//

import Foundation

import SwiftUI

class ImageDownloader {
    func loadImages() async throws -> ([ImageResizableModel]) {
        let url = URL(string: "https://picsum.photos/v2/list")!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let images = try JSONDecoder().decode([ImageResponse].self, from: data)
            return images.map { $0.toDomain() }
        } catch {
            return []
        }
    }
}
