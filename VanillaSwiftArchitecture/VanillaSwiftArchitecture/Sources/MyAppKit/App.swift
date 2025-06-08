//
//  App.swift
//  VanillaSwiftArchitecture
//
//  Created by クォン ジュンヒョク on 2025/06/08.
//

import ParentFeature
import SwiftUI

public protocol App: SwiftUI.App {
}

extension App {
    public var body: some Scene {
        WindowGroup {
            NavigationStack {
                ParentView(store: .init(state: .init()))
            }
        }
    }
}
