//
//  View+KBStyle.swift
//  KakaoBank-Clone
//
//  Created by Junho Lee on 2023/01/26.
//

import SwiftUI

// View를 extension하여 KBBlockViewStyle을 Global하게 호출 가능
extension View {
  func kbBlockViewStyle<S: KBBlockViewStyle>(_ style: S) -> some View {
    environment(\.blockViewStyle, AnyBlockViewStyle(style: style))
  }
}
