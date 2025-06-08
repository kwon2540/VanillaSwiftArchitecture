//
//  MacroError.swift
//  VanillaSwiftArchitecture
//
//  Created by クォン ジュンヒョク on 2025/06/08.
//

import Foundation

enum MacroError: Error, CustomStringConvertible {
    case notAnEnum

    var description: String {
        switch self {
        case .notAnEnum:
            return "@CaseIdentifiable can only be applied to enums"
        }
    }
}
