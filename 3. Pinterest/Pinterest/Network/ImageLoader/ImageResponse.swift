//
//  ImageResponse.swift
//  Pinterest
//
//  Created by Junho Lee on 2023/02/08.
//

import Foundation

// MARK: - ImageResponseElement
struct ImageResponse: Codable {
    let id, author: String
    let width, height: Int
    let url, downloadURL: String

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}

extension ImageResponse {
    func toDomain() -> ImageResizableModel {
        .init(url: downloadURL, width: CGFloat(width), height: CGFloat(height))
    }
}
