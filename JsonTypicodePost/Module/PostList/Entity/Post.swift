//
//  Post.swift
//  JsonTypicodePost
//
//  Created by Satori on 21/11/25.
//

import Foundation

struct Post: Identifiable, Decodable, Hashable {
    let id: Int
    let title: String
    let body: String
}
