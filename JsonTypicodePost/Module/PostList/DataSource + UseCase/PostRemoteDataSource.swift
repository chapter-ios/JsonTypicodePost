//
//  PostRemoteDataSource.swift
//  JsonTypicodePost
//
//  Created by Satori on 21/11/25.
//

import Foundation
import GeneralNetworkingHandler

protocol PostsRemoteDataSource {
    func fetchPosts() async throws -> [Post]
}

struct PostsRemoteDataSourceImpl: PostsRemoteDataSource {
    let networking: Networking

    func fetchPosts() async throws -> [Post] {
        return try await networking.get(
            "https://jsonplaceholder.typicode.com/posts",
            token: nil
        )
    }
}
