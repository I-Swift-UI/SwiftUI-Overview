//
//  EnvironmentKey+ KBStyle.swift
//  KakaoBank-Clone
//
//  Created by Junho Lee on 2023/01/26.
//

import SwiftUI

// EnvrionmentKey를 채택하여 .envirionment 메서드 사용 가능
struct KBBlockViewStyleKey: EnvironmentKey {
  // defa
  static var defaultValue = AnyBlockViewStyle(style: DefaultBlockViewStyle())
}

// EnvrionementValues를 extension하여 blockViewStyle 프로퍼티 추가, .environment 메서드에서 사용 가능
extension EnvironmentValues {
  // extension으로는 저장 프로퍼티를 추가할 수 없기 때문에, AnyblockViewStyle 사용.
  var blockViewStyle: AnyBlockViewStyle {
    get { self[KBBlockViewStyleKey.self] }
    set { self[KBBlockViewStyleKey.self] = newValue }
  }
}

// tpye-erased BlockView Style
struct AnyBlockViewStyle: KBBlockViewStyle {
  private var _makeBody: (Configuration) -> AnyView
  
  init<S: KBBlockViewStyle>(style: S) {
    _makeBody = { configuration in
      // AnyView를 통해 type을 erase 할 수 있음
      AnyView(style.makeBody(configuration: configuration))
    }
  }
  
  func makeBody(configuration: Configuration) -> some View {
    _makeBody(configuration)
  }
}

// Default BlockView Style
struct DefaultBlockViewStyle: KBBlockViewStyle {
  func makeBody(configuration: Configuration) -> some View {
    return YellowBlockViewStyle().makeBody(configuration: configuration)
  }
}
