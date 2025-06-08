//
//  Macros.swift
//  VanillaSwiftArchitecture
//
//  Created by クォン ジュンヒョク on 2025/06/01.
//

import Foundation

@attached(member, names: arbitrary)
public macro CaseHashable() = #externalMacro(module: "AppMacros", type: "CaseHashableMacro")

@attached(member, names: arbitrary)
public macro CaseIdentifiable() = #externalMacro(module: "AppMacros", type: "CaseIdentifiableMacro")
