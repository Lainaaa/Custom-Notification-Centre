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

protocol CustomNotificatinCenterProtocol {
    func addObserver(observer: NSObject, name: String, completion: @escaping () -> () )
    func removeObserver(observer: NSObject, name: String)
    func post(name: String)    
}

final class CustomNotificatinCenter: CustomNotificatinCenterProtocol {
    nonisolated(unsafe) static let shared = CustomNotificatinCenter()
    private init() {}
    
    /// Observers store
    private var observers: [String: [NSObject: () -> ()]] = [:]
    
    func addObserver(observer: NSObject, name: String, completion: @escaping () -> ()) {
        observers[name, default: [:]][observer] = completion
    }
    
    func removeObserver(observer: NSObject, name: String) {
        observers[name, default: [:]].removeValue(forKey: observer)
    }
    
    func post(name: String) {
        guard let observerDict = observers[name] else { return }
        
        for (_ , value) in observerDict {
            value()
        }
    }
}
