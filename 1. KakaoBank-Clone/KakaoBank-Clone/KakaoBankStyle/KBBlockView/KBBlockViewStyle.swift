//
//  KBButtonStyle.swift
//  KakaoBank-Clone
//
//  Created by Junho Lee on 2023/01/26.
//

import SwiftUI

// MARK: - Interface

protocol KBBlockViewStyle {
  associatedtype Body: View
  typealias Configuration = KBBlockViewStyleConfiguration
  
  func makeBody(configuration: Self.Configuration) -> Self.Body
}

/// KBBlockiViewStyle에서 Control하고자 하는 Configuration의 요소를 설정
struct KBBlockViewStyleConfiguration {
  /// A type-erased Title
  struct Title: View {
    init<Content: View>(content: Content) {
      body = AnyView(content)
    }
    
    var body: AnyView
  }
  
  /// A type-erased SubTitle
  struct SubTitle: View {
    init<Content: View>(content: Content) {
      body = AnyView(content)
    }
    
    var body: AnyView
  }
  
  /// A type-erased BottomCntent
  struct BottomContent: View {
    init<Content: View>(content: Content) {
      body = AnyView(content)
    }
    
    var body: AnyView
  }
  
  let title: KBBlockViewStyleConfiguration.Title
  let subtitle: KBBlockViewStyleConfiguration.SubTitle
  let bottomContent: KBBlockViewStyleConfiguration.BottomContent
}

// MARK: - Implementation

struct YellowBlockViewStyle: KBBlockViewStyle {
  func makeBody(configuration: Configuration) -> some View {
    GeometryReader { geometry in
           VStack(alignment: .leading, spacing: 5) {
             Group {
               configuration.title
                 .frame(width: .infinity)
                 .foregroundColor(.black)
                 .font(.title)
                 .minimumScaleFactor(1)
                 .offset(x: 10, y: 10)
               
               configuration.subtitle
                 .frame(width: .infinity)
                 .foregroundColor(.gray)
                 .fontWeight(.medium)
                 .offset(x: 10, y: 10)
             }
             
             Spacer()
               
             configuration.bottomContent
               .foregroundColor(Color.gray)
               .frame(maxWidth: .infinity, alignment: .trailing)
               .offset(x: -10, y: -5)
           }
       }
       .frame(maxWidth: .infinity, maxHeight: .infinity)
       .background(Color.yellow)
       .cornerRadius(10)
  }
}

struct BlackBlockViewStyle: KBBlockViewStyle {
  func makeBody(configuration: Configuration) -> some View {
    GeometryReader { geometry in
           VStack(alignment: .leading, spacing: 5) {
             Group {
               configuration.title
                 .frame(width: .infinity)
                 .foregroundColor(.white)
                 .font(.title)
                 .minimumScaleFactor(1)
                 .offset(x: 10, y: 10)
               
               configuration.subtitle
                 .frame(width: .infinity)
                 .foregroundColor(.white)
                 .fontWeight(.medium)
                 .offset(x: 10, y: 10)
             }
             
             Spacer()
               
             configuration.bottomContent
               .foregroundColor(Color.gray)
               .frame(maxWidth: .infinity, alignment: .trailing)
               .offset(x: -10, y: -5)
           }
       }
       .frame(maxWidth: .infinity, maxHeight: .infinity)
       .background(Color.gray)
       .cornerRadius(10)
  }
}
