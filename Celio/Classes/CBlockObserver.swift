//
//  BlockObserver.swift
//  Celio
//
//  Created by MP-11 on 30/07/18.
//  Copyright © 2018 Jatin. All rights reserved.
//

import Foundation

public struct CBlockObserver: COperationObserver {

  private let startHandler: ((COperation) -> Void)?
  private let producHandler: ((COperation, Operation) -> Void)?
  private let finishHandler: ((COperation, _ errors: [NSError]) -> Void)?

  init(startHandler: ((COperation) -> Void)? = nil,
       producHandler: ((COperation, Operation) -> Void)? = nil,
       finishHandler: ((COperation, [NSError]) -> Void)? = nil) {
    self.startHandler = startHandler
    self.producHandler = producHandler
    self.finishHandler = finishHandler
  }

    public func operationDidStart(operation: COperation) {
    startHandler?(operation)
  }

    public func operation(operation: COperation, didProduceOperation newOperation: Operation) {
    producHandler?(operation, newOperation)
  }

    public func operationDidFinish(operation: COperation, errors: [NSError]) {
    finishHandler?(operation, errors)
  }
}
