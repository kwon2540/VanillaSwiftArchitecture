//
//  CaseHashableMacro.swift
//  VanillaSwiftArchitecture
//
//  Created by クォン ジュンヒョク on 2025/06/01.
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxMacros

public struct CaseHashableMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        // Ensure we're working with an enum
        guard declaration.is(EnumDeclSyntax.self) else {
            throw MacroError.notAnEnum
        }

        // Create the hash(into:) function, which uses the 'id' property
        let hashFunction = try FunctionDeclSyntax(
            "func hash(into hasher: inout Hasher)"
        ) {
            "hasher.combine(id)"
        }

        // Create the static == function for Equatable conformance
        let equalityFunction = try FunctionDeclSyntax(
            "static func == (lhs: Self, rhs: Self) -> Bool"
        ) {
            "lhs.id == rhs.id"
        }

        return [
            DeclSyntax(hashFunction),
            DeclSyntax(equalityFunction)
        ]
    }
}
