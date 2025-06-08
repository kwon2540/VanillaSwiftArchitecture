//
//  ParentView.swift
//  VanillaSwiftArchitecture
//
//  Created by クォン ジュンヒョク on 2025/06/08.
//

import ChildFeature
import SwiftUI

public struct ParentView: View {
    @State var store: ParentStore

    public init(store: ParentStore) {
        self.store = store
    }

    public var body: some View {
        VStack {
            Button("modal") {
                store.send(.modalButtonTapped)
            }
            Button("push") {
                store.send(.pushButtonTapped)
            }
        }
        .fullScreenCover(item: $store.modalDestination) { destination in
            switch destination {
            case .child(let store):
                ChildView(store: store)
            }
        }
        .navigationDestination(item: $store.navigationDestination) { destination in
            switch destination {
            case .child(let store):
                ChildView(store: store)
            }
        }
    }
}

#Preview {
    ParentView(store: .init(state: .init()))
}
