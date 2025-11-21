//
//  PostsViewModel.swift
//  JsonTypicodePost
//
//  Created by Satori on 21/11/25.
//

import Foundation

final class PostsViewModel: ObservableObject {

    @Published var posts: [Post] = []
    @Published var state: ViewState = .idle

    private let getPostsUseCase: GetPostsUseCase

    init(getPostsUseCase: GetPostsUseCase) {
        self.getPostsUseCase = getPostsUseCase
    }

    @MainActor
    func loadPosts() async {
        state = .loading
        
        let loadPosts = await getPostsUseCase.execute()
        
        switch loadPosts {
        case .success(let success):
            self.posts = success
            self.state = .loaded
        case .failure(let failure):
            self.state = .failed(failure.localizedDescription)
        }
    }
}
