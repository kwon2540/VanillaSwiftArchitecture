//
//  Plugins.swift
//  VanillaSwiftArchitecture
//
//  Created by クォン ジュンヒョク on 2025/06/01.
//

import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct MacrosPlugin: CompilerPlugin {
    let providingMacros: [any Macro.Type] = [
        CaseHashableMacro.self,
        CaseIdentifiableMacro.self,
    ]
}
