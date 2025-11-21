//
//  AppDI.swift
//  JsonTypicodePost
//
//  Created by Satori on 21/11/25.
//

import Foundation
import Swinject

final class AppDI {
    static let shared = AppDI()
    let container = Container()

    private init() {
        registerPostModule()
    }

    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(type)!
    }
}

