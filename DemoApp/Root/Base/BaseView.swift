//
//  BaseView.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import SwiftUI

struct BaseView<BuilderContent: View>: View {
    private var builderContent: BuilderContent
    
    init(@ViewBuilder builderContent: () -> BuilderContent = { EmptyView() }) {
        self.builderContent = builderContent()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            builderContent
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 100)
        .edgesIgnoringSafeArea(.bottom)
    }
}
