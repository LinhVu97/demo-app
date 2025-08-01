//
//  HomeView.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        Text("Hello, \(viewModel.username)!")
            .foregroundStyle(.black)
    }
}
