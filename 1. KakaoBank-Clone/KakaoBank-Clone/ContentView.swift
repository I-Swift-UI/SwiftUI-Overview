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
  
  private enum Metric {
    static let largetBlockWidth = 214.f
    static let largetBlockHeight = 257.f
    static let smallBlockWidth = 105.f
    static let smallBlockHeight = 105.f
  }
  
  var body: some View {
    VStack(spacing: 7) {
      HStack(spacing: 7) {
        KBBlockView {
          Text("5342P")
        } subtitle: {
          Text("카카오페이포인트")
        } bottomContent: {
          Image.init(systemName: "plus")
            .frame(width: 30, height: 30)
            .background(
              Circle()
                .foregroundColor(.white)
                .opacity(0.5)
            )
        }
        .frame(width:214, height: 257)
        .kbBlockViewStyle(YellowBlockViewStyle())
        
        VStack(spacing: 7) {
          KBBlockView {
            Text("선택하기")
          } subtitle: {
            Text("송금")
          } bottomContent: {
            Image.init(systemName: "plus")
              .frame(width: 15, height: 15)
              .background(
                Circle()
                  .foregroundColor(.white)
                  .opacity(0.5)
              )
          }
          .frame(width:105, height: 125)
          .kbBlockViewStyle(BlackBlockViewStyle())
          
          KBBlockView {
            Text("선택하기")
          } subtitle: {
            Text("결제")
          } bottomContent: {
            Image.init(systemName: "plus")
              .frame(width: 15, height: 15)
              .background(
                Circle()
                  .foregroundColor(.white)
                  .opacity(0.5)
              )
          }
          .frame(width:105, height: 125)
          .kbBlockViewStyle(BlackBlockViewStyle())
        }
      }
      KBBlockView {
        Text("주식회사 카카오")
      } subtitle: {
        Text("4890원")
      } bottomContent: {
        VStack(alignment: .trailing) {
          Text("결제")
          Text("01.21(토) 09:14")
        }
      }
      .frame(width:326, height: 124)
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
