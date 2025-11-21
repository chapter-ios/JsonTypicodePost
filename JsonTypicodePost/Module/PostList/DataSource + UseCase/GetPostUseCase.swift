//
//  GetPostUseCase.swift
//  JsonTypicodePost
//
//  Created by Satori on 21/11/25.
//

import Foundation

struct GetPostsUseCase {
    private let repository: PostsRemoteDataSource

    init(repository: PostsRemoteDataSource) {
        self.repository = repository
    }

    func execute() async -> Result<[Post], ApiError> {
        do {
            let data = try await repository.fetchPosts()
            return .success(data)
        } catch let error as ApiError {
            return .failure(error)
        } catch {
            let displayError = ApiError.unknown(
                statusCode: nil,
                message: error.localizedDescription
            )
            return .failure(displayError)
        }
    }
}
