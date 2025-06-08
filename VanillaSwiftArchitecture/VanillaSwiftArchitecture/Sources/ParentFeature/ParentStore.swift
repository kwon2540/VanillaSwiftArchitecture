//
//  ParentStore.swift
//  VanillaSwiftArchitecture
//
//  Created by クォン ジュンヒョク on 2025/06/08.
//

import ChildFeature
import Foundation
import Observation
import Store

@Observable
@MainActor
public class ParentStore: Store {
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
        case modalButtonTapped
        case pushButtonTapped
    }

    enum Destination {
        @CaseIdentifiable
        enum Modal: Identifiable {
            case child(ChildStore)
        }

        @CaseIdentifiable
        @CaseHashable
        enum Navigation: Hashable {
            case child(ChildStore)
        }
    }

    // View側で見るState
    private(set) var viewState = ViewState()
    // Store内のState
    private var state: State
    var modalDestination: Destination.Modal?
    var navigationDestination: Destination.Navigation?

    public init(state: State) {
        self.state = state
    }

    // Action
    public func reduce(action: Action) {
        switch action {
        case .modalButtonTapped:
            modalAction()
        case .pushButtonTapped:
            pushAction()
        }
    }
}

private extension ParentStore {
    func modalAction() {
        modalDestination = .child(.init(state: .init()))
    }

    func pushAction() {
        navigationDestination = .child(.init(state: .init()))
    }
}
