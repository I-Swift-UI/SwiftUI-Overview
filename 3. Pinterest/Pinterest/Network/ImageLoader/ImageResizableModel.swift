//
//  ImageResizableModel.swift
//  Pinterest
//
//  Created by Junho Lee on 2023/02/08.
//

import Foundation

struct ImageResizableModel: Hashable {
    let url: String
    let width, height: CGFloat
    
    func layoutSize() -> (width: CGFloat, height: CGFloat) {
        let leftAndRightAnchor = 10.f
        let spacing = 10.f
        let cellWidth = (UIFrame.Width - leftAndRightAnchor - spacing) / 2
        
        let heightWidthRatio = self.height / self.width
        
        return (cellWidth, cellWidth * heightWidthRatio)
    }
}

extension ImageResizableModel {
    static let dummys: [ImageResizableModel] = [
        .init(url: "https://picsum.photos/id/237/200/300", width: 5000, height: 3333),
        .init(url: "https://picsum.photos/id/237/200/300", width: 2000, height: 1600),
        .init(url: "https://picsum.photos/id/237/200/300", width: 2000, height: 1400),
        .init(url: "https://picsum.photos/id/237/200/300", width: 3000, height: 2400),
        .init(url: "https://picsum.photos/id/237/200/300", width: 5000, height: 1500),
        .init(url: "https://picsum.photos/id/237/200/300", width: 5000, height: 3000),
        .init(url: "https://picsum.photos/id/237/200/300", width: 4000, height: 2200),
        .init(url: "https://picsum.photos/id/237/200/300", width: 2000, height: 1000),
        .init(url: "https://picsum.photos/id/237/200/300", width: 2000, height: 1400),
        .init(url: "https://picsum.photos/id/237/200/300", width: 3000, height: 2400),
        .init(url: "https://picsum.photos/id/237/200/300", width: 5000, height: 1500),
        .init(url: "https://picsum.photos/id/237/200/300", width: 5000, height: 3000),
        .init(url: "https://picsum.photos/id/237/200/300", width: 4000, height: 2200),
        .init(url: "https://picsum.photos/id/237/200/300", width: 2000, height: 1000),
        .init(url: "https://picsum.photos/id/237/200/300", width: 2000, height: 1400),
        .init(url: "https://picsum.photos/id/237/200/300", width: 3000, height: 2400),
        .init(url: "https://picsum.photos/id/237/200/300", width: 5000, height: 1500),
        .init(url: "https://picsum.photos/id/237/200/300", width: 5000, height: 3000),
        .init(url: "https://picsum.photos/id/237/200/300", width: 4000, height: 2200),
        .init(url: "https://picsum.photos/id/237/200/300", width: 2000, height: 1000)
    ]
    
    static func arrangeModels(model: [ImageResizableModel]) -> (leftItems: [ImageResizableModel],
                                                                rightItems: [ImageResizableModel]) {
        var leftHeight: CGFloat = 0
        var rightHeight: CGFloat = 0
        
        var leftItems: [ImageResizableModel] = []
        var rightItems: [ImageResizableModel] = []
        model.forEach { model in
            if leftHeight <= rightHeight {
                leftHeight += model.layoutSize().height
                leftItems.append(model)
            } else {
                rightHeight += model.layoutSize().height
                rightItems.append(model)
            }
        }
        
        return (leftItems, rightItems)
    }
}
