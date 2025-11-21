//
//  ViewState.swift
//  JsonTypicodePost
//
//  Created by Satori on 21/11/25.
//

import Foundation

enum ViewState: Equatable {
    case idle
    case loading
    case loaded
    case failed(String)
}
