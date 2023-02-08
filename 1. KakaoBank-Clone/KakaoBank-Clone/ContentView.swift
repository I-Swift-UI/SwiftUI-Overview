//
//  ContentView.swift
//  KakaoBank-Clone
//
//  Created by Junho Lee on 2023/01/25.
//

import SwiftUI

extension Int {
  var f: CGFloat {
    return CGFloat(self)
  }
}

struct ContentView: View {
  

  
  let data: [CellData] = [
    CellData(size: .small),
    CellData(size: .medium),
    CellData(size: .large),
    CellData(size: .medium),
    CellData(size: .small),
  ]
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        ForEach(0 ..< 5) { row in
          HStack {
            ForEach(0 ..< 5) { column in
              CellView(data: self.data[column],
                       size: geometry.size)
            }
          }
        }
      }
      .padding()
    }
  }
  
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      ContentView()
    }
  }
}

struct CellData {
  let size: CellSize
}

struct CellView: View {
  let data: CellData
  let size: CGSize
  
  var body: some View {
    let cellWidth: CGFloat
    let cellHeight: CGFloat
    
    switch data.size {
    case .small:
      cellWidth = (size.width - 30) / 5
      cellHeight = (size.height - 30) / 5
    case .medium:
      cellWidth = (size.width - 20) / 4
      cellHeight = (size.height - 20) / 4
    case .large:
      cellWidth = (size.width - 10) / 3
      cellHeight = (size.height - 10) / 3
    }
    
    return Text("Cell")
      .frame(width: cellWidth, height: cellHeight)
      .background(Color.gray)
  }
}

enum CellSize {
  case small
  case medium
  case large
}
