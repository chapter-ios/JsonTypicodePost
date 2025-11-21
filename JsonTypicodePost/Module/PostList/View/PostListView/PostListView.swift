//
//  PostListView.swift
//  JsonTypicodePost
//
//  Created by Satori on 21/11/25.
//

import SwiftUI

struct PostListView: View {
    @StateObject var vm: PostsViewModel

    var body: some View {
        NavigationStack {
            Group {
                switch vm.state {
                case .idle, .loading:
                    VStack(spacing: 12) {
                        ProgressView()
                        Text("Loading...")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                case .loaded:
                    ListChildView(vm: vm)
                case .failed(let err):
                    ListErrorView(
                        vm: vm,
                        err: err
                    )
                }
            }
            .navigationDestination(for: Post.self) { post in
                PostDetailView(post: post)
            }
            .navigationTitle("Posts")
        }
        .onAppear {
            if case .idle = vm.state {
                Task {
                    await vm.loadPosts()
                }
            }
        }
    }
}

#Preview {
    let mockPosts = [
        Post(id: 1, title: "Sample Title 1", body: "Sample body 1"),
        Post(id: 2, title: "Sample Title 2", body: "Sample body 2")
    ]

    let mockDataSource = MockPostsRemoteDataSource(posts: mockPosts)
    let useCase = GetPostsUseCase(repository: mockDataSource)
    let vm = PostsViewModel(getPostsUseCase: useCase)

    PostListView(vm: vm)
}
