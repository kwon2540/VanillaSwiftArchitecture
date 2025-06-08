//
//  CaseIdentifiableMacro.swift
//  VanillaSwiftArchitecture
//
//  Created by クォン ジュンヒョク on 2025/06/01.
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxMacros

public struct CaseIdentifiableMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        // Ensure we're working with an enum
        guard let enumDecl = declaration.as(EnumDeclSyntax.self) else {
            throw MacroError.notAnEnum
        }

        // Get all enum cases
        let enumCases = enumDecl.memberBlock.members
            .compactMap { $0.decl.as(EnumCaseDeclSyntax.self) }
            .flatMap { $0.elements }

        // Generate switch cases for the id property
        var switchCases: [SwitchCaseSyntax] = []

        for enumCase in enumCases {
            let caseName = enumCase.name.text

            // Check if the case has an associated value
            if enumCase.parameterClause?.parameters.first != nil {
                let switchCase = SwitchCaseSyntax(
                    label: .case(.init(
                        caseItems: [.init(
                            pattern: ExpressionPatternSyntax(
                                expression: FunctionCallExprSyntax(
                                    calledExpression: MemberAccessExprSyntax(
                                        period: .periodToken(),
                                        name: .identifier(caseName)
                                    ),
                                    leftParen: .leftParenToken(),
                                    arguments: [.init(
                                        expression: PatternExprSyntax(
                                            pattern: IdentifierPatternSyntax(
                                                identifier: .identifier("let value")
                                            )
                                        )
                                    )],
                                    rightParen: .rightParenToken()
                                )
                            )
                        )]
                    )),
                    statements: [.init(
                        item: .expr(ExprSyntax(
                            MemberAccessExprSyntax(
                                base: DeclReferenceExprSyntax(baseName: .identifier("value")),
                                period: .periodToken(),
                                name: .identifier("id")
                            )
                        ))
                    )]
                )
                switchCases.append(switchCase)
            }
        }

        // Create the id computed property
        let idProperty = try VariableDeclSyntax(
            "var id: ObjectIdentifier"
        ) {
            SwitchExprSyntax(subject: DeclReferenceExprSyntax(baseName: .identifier("self"))) {
                for switchCase in switchCases {
                    switchCase
                }
            }
        }

        return [DeclSyntax(idProperty)]
    }
}
