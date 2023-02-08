//
//  HomeView.swift
//  Pinterest
//
//  Created by Junho Lee on 2023/02/08.
//

import SwiftUI

struct HomeView: View {
    let loader = ImageDownloader()
    @State var images = [ImageResizableModel]()
    var dummys = ImageResizableModel.dummys
    
    var body: some View {
        ScrollView {
            LazyHStack(alignment: .top) {
                LazyVStack(alignment: .center, spacing: 10) {
                    ForEach(ImageResizableModel.arrangeModels(model: images).leftItems, id: \.self) { model in
                        let layoutSize = model.layoutSize()
                        AsyncImage(url: URL.init(string: model.url)) { image in
                            image.resizable()
                        } placeholder: {
                            Text("플레이스홀더")
                        }.frame(width: layoutSize.width,
                                height: layoutSize.height)
                    }
                }
                
                LazyVStack(alignment: .center, spacing: 10) {
                    ForEach(ImageResizableModel.arrangeModels(model: images).rightItems, id: \.self) { model in
                        let layoutSize = model.layoutSize()
                        AsyncImage(url: URL.init(string: model.url)) { image in
                            image.resizable()
                        } placeholder: {
                            Color.gray
                        }.frame(width: layoutSize.width,
                                height: layoutSize.height)
                    }
                }
            }
        }.task {
            do {
                let images = try await loader.loadImages()
                self.images = images
            } catch {
                // Error Handling
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
