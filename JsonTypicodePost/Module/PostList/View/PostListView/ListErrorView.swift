//
//  ListErrorView.swift
//  JsonTypicodePost
//
//  Created by Satori on 21/11/25.
//

import SwiftUI

struct ListErrorView: View {
    @ObservedObject var vm: PostsViewModel
    var err: String
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Error")
                .font(.title3.bold())
            Text(err)
                .font(.subheadline)
                .multilineTextAlignment(.center)
            Button("Retry") {
                Task {
                    await vm.loadPosts()
                }
                
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
