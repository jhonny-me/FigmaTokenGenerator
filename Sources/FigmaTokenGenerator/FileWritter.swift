//
//  FileWritter.swift
//  
//
//  Created by Johnny Gu on 2022/4/19.
//

import Foundation

class FileWritter {
    func write(_ array: [String], to outputPath: String) throws {
        let outputString = """
//
//  DesignTokenIdentity.swift
//
//
//  Updated by DesignTokenGenerator on \(currentTimestamp())
//

import Foundation

public struct DesignTokenIdentity {
\(formattedStringCases(array))
}
"""
        try outputString.write(toFile: outputPath, atomically: true, encoding: .utf8)
    }

    func formattedStringCases(_ array: [String]) -> String {
        array.map({ key in
            let characterSet = CharacterSet(charactersIn: "/-")
            let keyComponents = key.components(separatedBy: characterSet).filter { !$0.isEmpty }
            let keyToken = keyComponents[1...].reduce(keyComponents[0], { $0 + $1.firstCapitalized })
            return "\tpublic static let \(keyToken) = \"\(key)\""
        }).joined(separator: "\n")
    }

    func currentTimestamp() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter.string(from: date)
    }
}

