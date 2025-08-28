//
//  Alphabet.swift
//  Custom-Notification-Centre
//
//  Created by Dmitrij Meidus on 27.08.25.
//

import Foundation

enum LidershipNotifications: String {
    case moneyReceived = "money received"
}

protocol CarConcern: NSObject {}

extension CarConcern {
    func moneyReceived(){
        let className = String(describing: type(of: self))
        print("\(className) received money!")
        CustomNotificatinCenter.shared.removeObserver(observer: self, name: LidershipNotifications.moneyReceived.rawValue)
    }
}

final class Audi: NSObject, CarConcern {
    override init() {
        super.init()
        CustomNotificatinCenter.shared.addObserver(observer: self, name: LidershipNotifications.moneyReceived.rawValue) { 
            print("Audi: Give money to Audi, we will make new electric audi!")
        }
    }
}

final class Volkswagen: NSObject, CarConcern {
    override init() {
        super.init()
        CustomNotificatinCenter.shared.addObserver(observer: self, name: LidershipNotifications.moneyReceived.rawValue) { 
            print("Volkswagen: Give money to Volkswagen, we will make cheap car for people!")
        }
    }
}

final class Porsche: NSObject, CarConcern {
    override init() {
        super.init()
        CustomNotificatinCenter.shared.addObserver(observer: self, name: LidershipNotifications.moneyReceived.rawValue) { 
            print("Porsche: Just give money to Porsche")
        }
    }
}

final class Lidership: NSObject {
    func announceMoney(){
        print("Lidership: we got more money!")
        CustomNotificatinCenter.shared.post(name: LidershipNotifications.moneyReceived.rawValue)
    }
}

final class Example {
    func showCustomNotificationCenter(){
        var audi: Audi? = Audi()
        var volkswagen: Volkswagen? = Volkswagen()
        var porsche: Porsche? = Porsche()
        
        let lidership = Lidership()
        
        lidership.announceMoney()
        
        // giving money to porsche
        porsche?.moneyReceived()
        porsche = nil
        
        lidership.announceMoney()
    }
}
