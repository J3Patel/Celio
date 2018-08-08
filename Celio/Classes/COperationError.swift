//
//  OperationError.swift
//  Celio
//
//  Created by MP-11 on 30/07/18.
//  Copyright © 2018 Jatin. All rights reserved.
//

import Foundation

public enum CErrorDomain: String {
    case APIError
    case COperationError
}

public enum COperationErrorCode: Int {
  case conditionFailed = 1
  case executionFailed = 2
}

// This makes it easy to compare an `NSError.code` to an `OperationErrorCode`.
public func == (lhs: Int, rhs: COperationErrorCode) -> Bool {
  return lhs == rhs.rawValue
}

public func == (lhs: COperationErrorCode, rhs: Int) -> Bool {
  return lhs.rawValue == rhs
}
