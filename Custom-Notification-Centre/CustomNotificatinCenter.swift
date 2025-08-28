//
//  CustomNotificatinCenter.swift
//  Custom-Notification-Centre
//
//  Created by Dmitrij Meidus on 27.08.25.
//

import Foundation

/*A lightweight notification center protocol for elegant observer pattern implementation
 
 Core functionality:
 • `Adding` and `removing` observers  
 • `Posting` notifications
 • `Handling` notifications
 */

protocol CustomNotificatinCenterProtocol: Sendable {
    func addObserver(observer: NSObject, name: String, completion: @escaping () -> () )
    func removeObserver(observer: NSObject, name: String)
    func post(name: String)    
}

final class CustomNotificatinCenter: CustomNotificatinCenterProtocol, @unchecked Sendable {
    static let shared = CustomNotificatinCenter()
    private init() {}
    
    /// Observers store
    private var observers: [String: [NSObject: () -> ()]] = [:]
    
    private let queue = DispatchQueue(label: "com.example.serial")
    
    func addObserver(observer: NSObject, name: String, completion: @escaping () -> ()) {
        queue.sync {
            observers[name, default: [:]][observer] = completion
        }
    }
    
    func removeObserver(observer: NSObject, name: String) {
        queue.sync {
            _ = observers[name, default: [:]].removeValue(forKey: observer)
        }
    }
    
    func post(name: String) {
        var handlers: [() -> Void] = []
        queue.sync {
            if let dict = observers[name] {
                handlers = Array(dict.values)
            } else {
                handlers = []
            }
        }
        for handler in handlers {
            handler()
        }
    }

}
