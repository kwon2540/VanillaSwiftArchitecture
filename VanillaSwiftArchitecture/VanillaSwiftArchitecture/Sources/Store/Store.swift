//
//  Store.swift
//  VanillaSwiftArchitecture
//
//  Created by クォン ジュンヒョク on 2025/06/01.
//

import Foundation

open class Store: Identifiable, Hashable {
    public init() {}

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: Store, rhs: Store) -> Bool {
        lhs.id == rhs.id
    }
}
