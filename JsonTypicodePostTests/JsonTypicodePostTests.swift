//
//  JsonTypicodePostTests.swift
//  JsonTypicodePostTests
//
//  Created by Satori on 21/11/25.
//

import XCTest
@testable import JsonTypicodePost

final class PostsViewModelTests: XCTestCase {

    func test_loadPosts_success() async {
        // Given
        let mockPosts = [
            Post(id: 1, title: "Title 1", body: "Body 1"),
            Post(id: 2, title: "Title 2", body: "Body 2")
        ]

        let mockDataSource = MockPostsRemoteDataSource(
            posts: mockPosts,
            shouldFail: false
        )

        let useCase = GetPostsUseCase(repository: mockDataSource)
        let vm = PostsViewModel(getPostsUseCase: useCase)

        // When
        await vm.loadPosts()

        // Then
        XCTAssertEqual(vm.posts, mockPosts)
        XCTAssertEqual(vm.state, .loaded)
    }


    func test_loadPosts_apiError_failure() async {
        // Given
        let mockDataSource = MockPostsRemoteDataSource(
            posts: [],
            shouldFail: true
        )

        let useCase = GetPostsUseCase(repository: mockDataSource)
        let vm = PostsViewModel(getPostsUseCase: useCase)

        // When
        await vm.loadPosts()

        // Then
        switch vm.state {
        case .failed(let message):
            XCTAssertEqual(message, "Mock server error")
        default:
            XCTFail("Expected .failed state, got \(vm.state)")
        }
    }
}
