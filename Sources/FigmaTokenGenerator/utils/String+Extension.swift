//
//  String+Extension.swift
//  
//
//  Created by Johnny Gu on 2022/4/19.
//

import Foundation

extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}
