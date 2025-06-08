//
//  ChildView.swift
//  VanillaSwiftArchitecture
//
//  Created by クォン ジュンヒョク on 2025/06/08.
//

import SwiftUI

public struct ChildView: View {
    @State var store: ChildStore

    @Environment(\.dismiss) var dismiss

    public init(store: ChildStore) {
        self.store = store
    }

    public var body: some View {
        VStack {
            Text("ChildView")

            Button("Dismiss") {
                dismiss()
            }
        }
        .navigationTitle("ChildView")
    }
}

#Preview {
    ChildView(store: .init(state: .init()))
}
