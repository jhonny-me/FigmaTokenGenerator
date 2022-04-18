//
//  ErrorOutput.swift
//  
//
//  Created by Johnny Gu on 2022/4/18.
//

import Foundation

public func warn(_ warning: String) {
  print("warning: [FigmaTokenGenerator] \(warning)")
}

public func fail(_ error: String) {
  print("error: [FigmaTokenGenerator] \(error)")
}
