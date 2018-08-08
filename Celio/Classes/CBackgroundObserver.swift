//
//  CBackgroundObserver.swift
//  Celio
//
//  Created by MP-11 on 06/08/18.
//  Copyright © 2018 Jatin. All rights reserved.
//

import Foundation
import UIKit

open class CBackgroundObserver: NSObject, COperationObserver {

    private var identifier = UIBackgroundTaskInvalid
    private var isInBackground = false

    public override init() {
        super.init()
        NotificationCenter.default.addObserver(self,
                                               selector: Selector(("didEnterBackground:")),
                                               name: NSNotification.Name.UIApplicationDidEnterBackground,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: Selector(("didEnterForeground:")),
                                               name: Notification.Name.UIApplicationDidBecomeActive,
                                               object: nil)
        isInBackground = UIApplication.shared.applicationState == .background
        if isInBackground {
            startBackgroundTask()
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func didEnterBackground(notification: Notification) {
        if !isInBackground {
            isInBackground = true
            startBackgroundTask()
        }
    }

    @objc func didEnterForeground(notification: NSNotification) {
        if isInBackground {
            isInBackground = false
            endBackgroundTask()
        }
    }

    private func startBackgroundTask() {
        if identifier == UIBackgroundTaskInvalid {
            identifier = UIApplication.shared.beginBackgroundTask(withName: "CBackgroundObserver",
                                                                  expirationHandler: { [weak self] in
                                                                    self?.endBackgroundTask()
            })
        }
    }

    private func endBackgroundTask() {
        if identifier != UIBackgroundTaskInvalid {
            UIApplication.shared.endBackgroundTask(identifier)
            identifier = UIBackgroundTaskInvalid
        }
    }

    public func operationDidStart(operation: COperation) {
    }

    public func operation(operation: COperation, didProduceOperation newOperation: Operation) {

    }

    public func operationDidFinish(operation: COperation, errors: [NSError]) {
        endBackgroundTask()
    }
}
