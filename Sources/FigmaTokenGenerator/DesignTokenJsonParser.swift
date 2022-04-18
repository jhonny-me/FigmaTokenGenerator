//
//  File.swift
//  
//
//  Created by Johnny Gu on 2022/4/18.
//

import Foundation

/// Main class to format raw json to more efficient json
/// - Note:
///
/// From:
///
/// ```
/// "general": {
///   "color": {
///    "bodytext": {
///      "fill": {
///        "accent": {
///          "value": "{brand.blue}",
///          "type": "color"
///        },
///      }
///    }
///  }
/// }
/// ```
///
/// To:
///
/// ```
/// ["color/bodytext/fill/accent",... , "color/bodytext/fill/body"]
/// ```
///

final class DesignTokenJsonParser {
    func parseMap(_ map: [String: Any]) -> [String] {
        var keys: Set<String> = []
        guard let _ = map["global"] as? [String: Any] else {
            fatalError("There's no global config in this json!!!")
        }
        for (key, value) in map {
            guard
                key != "global",
                let value = value as? [String: Any] else { continue }
            parseKeyBlock(keys: &keys, previousPath: key, map: value)
        }

        return Array(keys).sorted()
    }

    private func parseKeyBlock(keys: inout Set<String>, previousPath: String, map: [String: Any]) {
        if let type = map["type"] as? String { // deepest map
            switch type {
            case "color":
                guard let _ = map["value"] as? String else { // {brand.white}
                    break
                }
                if
                    let firstSeparatorIndex = previousPath.firstIndex(of: "/") {
                    let excludeIndex = previousPath.index(after: firstSeparatorIndex)
                    let pathExcludeTheme = previousPath[excludeIndex...]
                    keys.insert(String(pathExcludeTheme))
                }
            case "typography":
                guard let _ = map["value"] else {
                    break
                }
                if
                    let firstSeparatorIndex = previousPath.firstIndex(of: "/") {
                    let excludeIndex = previousPath.index(after: firstSeparatorIndex)
                    let pathExcludeTheme = previousPath[excludeIndex...]
                    keys.insert(String(pathExcludeTheme))
                }
            default:
                break
            }
        } else { // keep searching
            for (innerKey, innerMap) in map {
                guard let innerMap = innerMap as? [String: Any] else { continue }
                parseKeyBlock(keys: &keys,
                              previousPath: "\(previousPath)/\(innerKey)",
                              map: innerMap)
            }
        }
    }
}
