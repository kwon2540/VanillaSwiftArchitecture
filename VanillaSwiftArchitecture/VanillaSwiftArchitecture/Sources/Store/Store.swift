//
//  Store.swift
//  VanillaSwiftArchitecture
//
//  Created by クォン ジュンヒョク on 2025/06/01.
//

import Foundation

@MainActor
public protocol Store: Identifiable, Hashable {
    associatedtype Action

    func reduce(action: Action)
}

extension Store {
    public func send(_ action: Action) {
        reduce(action: action)
    }

    nonisolated public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    nonisolated public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
