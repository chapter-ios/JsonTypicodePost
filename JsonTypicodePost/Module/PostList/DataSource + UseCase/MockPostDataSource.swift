//
//  MockPostDataSource.swift
//  JsonTypicodePost
//
//  Created by Satori on 21/11/25.
//

import Foundation
import GeneralNetworkingHandler

final class MockPostsRemoteDataSource: PostsRemoteDataSource {
    let posts: [Post]
    let shouldFail: Bool

    init(posts: [Post], shouldFail: Bool = false) {
        self.posts = posts
        self.shouldFail = shouldFail
    }

    func fetchPosts() async throws -> [Post] {
        if shouldFail {
            throw ApiError.serverError(message: "Mock server error")
        }
        return posts
    }
}
