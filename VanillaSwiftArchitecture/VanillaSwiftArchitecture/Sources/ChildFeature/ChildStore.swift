//
//  ChildStore.swift
//  VanillaSwiftArchitecture
//
//  Created by クォン ジュンヒョク on 2025/06/08.
//

import Foundation
import Observation
import Store

@Observable
@MainActor
public class ChildStore: Store {
    public struct ViewState {
        var a = ""
        var b = ""
        var c = ""
    }

    public struct State {
        var a = ""
        var b = ""
        var c = ""

        public init() {}
    }

    public enum Action {
        case none
    }

    // View側で見るState
    private(set) var viewState = ViewState()
    // Store内のState
    private var state: State

    public init(state: State) {
        self.state = state

        super.init()
    }

    // Action
    func send(_ action: Action) {
        switch action {
        case .none:
            break
        }
    }
}
