//
//  ListChildView.swift
//  JsonTypicodePost
//
//  Created by Satori on 21/11/25.
//

import SwiftUI

struct ListChildView: View {
    @ObservedObject var vm: PostsViewModel
    
    var body: some View {
        List(vm.posts) { post in
            NavigationLink(value: post) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
                .padding(.vertical, 4)
            }
        }
    }
}
