//
//  CMutuallyExclusive.swift
//  Celio
//
//  Created by MP-11 on 06/08/18.
//  Copyright © 2018 Jatin. All rights reserved.
//

import Foundation

public struct CMutuallyExclusive<T>: COperationCondition {

    public init() { }

    public static var name: String {
        return "MutuallyExclusive<\(T.self)>"
    }

    public static var isMutuallyExclusive: Bool {
        return true
    }

    public func dependency(for operation: COperation) -> Operation? {
        return nil
    }

    public func evaluate(for operation: COperation, completion: @escaping (OperationConditionResult) -> Void) {
        return completion(.satisfied)
    }
}
