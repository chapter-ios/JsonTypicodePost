//
//  PostRemoteDataSource.swift
//  JsonTypicodePost
//
//  Created by Satori on 21/11/25.
//

import Foundation

protocol PostsRemoteDataSource {
    func fetchPosts() async throws -> [Post]
}

struct PostsRemoteDataSourceImpl: PostsRemoteDataSource {
    let networking: Networking

    func fetchPosts() async throws -> [Post] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        return try await networking.get(url)
    }
}
