//
//  ContentView.swift
//  JsonTypicodePost
//
//  Created by Satori on 21/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let vm: PostsViewModel = AppDI.shared.resolve(PostsViewModel.self)
        PostListView(vm: vm)
    }
}

#Preview {
    ContentView()
}
