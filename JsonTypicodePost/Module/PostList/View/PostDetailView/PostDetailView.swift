//
//  PostDetailView.swift
//  JsonTypicodePost
//
//  Created by Satori on 21/11/25.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(post.title)
                    .font(.title2.bold())
                Text(post.body)
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PostDetailView(post: Post(id: 1, title: "Preview Title", body: "Preview body text here"))
}
