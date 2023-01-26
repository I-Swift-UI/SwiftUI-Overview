//
//  KBBlockView.swift
//  KakaoBank-Clone
//
//  Created by Junho Lee on 2023/01/26.
//

import SwiftUI

struct KBBlockView<Title: View, SubTitle: View, BottomContent: View>: View {
  var title: () -> Title
  var subtitle: () -> SubTitle
  var bottomContent: () -> BottomContent
  @Environment(\.blockViewStyle) var style
  
  var body: some View {
    style
      .makeBody(
        configuration: KBBlockViewStyleConfiguration(
          title: KBBlockViewStyleConfiguration.Title(content: title()),
          subtitle: KBBlockViewStyleConfiguration.SubTitle(content: subtitle()),
          bottomContent: KBBlockViewStyleConfiguration.BottomContent(content: bottomContent())
        )
      )
  }
}
