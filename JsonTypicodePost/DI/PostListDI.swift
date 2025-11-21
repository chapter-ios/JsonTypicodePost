//
//  PostListDI.swift
//  JsonTypicodePost
//
//  Created by Satori on 21/11/25.
//

import Foundation

extension AppDI {
    
    func registerPostModule() {

        container.register(Networking.self) { _ in
            NetworkingHelper()
        }

        container.register(PostsRemoteDataSource.self) { r in
            PostsRemoteDataSourceImpl(
                networking: r.resolve(Networking.self)!
            )
        }

        container.register(GetPostsUseCase.self) { r in
            GetPostsUseCase(
                repository: r.resolve(PostsRemoteDataSource.self)!
            )
        }

        container.register(PostsViewModel.self) { r in
            PostsViewModel(
                getPostsUseCase: r.resolve(GetPostsUseCase.self)!
            )
        }
    }
}
