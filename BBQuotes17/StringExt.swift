//
//  StringExt.swift
//  BBQuotes17
//
//  Created by Lyle Dane Carcedo on 11/30/24.
//

import Foundation

extension String {
    /// Removes spaces and converts to PascalCase.
    /// - Tag: removeWhiteSpaceAndConvertToPascal
    func removeWhiteSpaceAndConvertToPascal() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
            .split(separator: " ")
            .map { $0.capitalized }
            .joined()
    }

    /// Executes the [`removeWhiteSpaceAndConvertToPascal`](x-source-tag://removeWhiteSpaceAndConvertToPascal) and then appends the string value "Button" .
    /// - Returns: A PascalCase string with string "Button" appended at the end.
    func generateButtonAssetName() -> String {
        "\(self.removeWhiteSpaceAndConvertToPascal())Button"
    }

    /// Executes the [`removeWhiteSpaceAndConvertToPascal`](x-source-tag://removeWhiteSpaceAndConvertToPascal) and then appends the string value "Shadow".
    /// - Returns: A PascalCase string with string "Shadow" appended at the end.
    func generateShadowAssetName() -> String {
        "\(self.removeWhiteSpaceAndConvertToPascal())Shadow"
    }
}
