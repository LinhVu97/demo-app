//
//  RegisterView.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel: RegisterViewModel
    
    var body: some View {
        Button {
            viewModel.dismissScreen()
        } label: {
            Text("Dismiss")
        }
    }
}
