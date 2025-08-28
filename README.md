# Custom Notification Centre 🔔

Lightweight notification center implementation for Swift using observer pattern.

## Features
- ✨ Simple observer registration and removal
- 📢 Event broadcasting to multiple observers  
- 🧹 Automatic memory management
- ⚡ Lightweight and fast

## Usage
```swift
// Add observer
CustomNotificatinCenter.shared.addObserver(observer: self, name: "moneyReceived") {
    print("Money received!")
}

// Post notification
CustomNotificatinCenter.shared.post(name: "moneyReceived")

// Remove observer
CustomNotificatinCenter.shared.removeObserver(observer: self, name: "moneyReceived")
```

## Example Output
```
📢 First announcement - all companies are subscribed:
Lidership: we got more money!
Audi: Give money to Audi, we will make new electric audi!
Porsche: Just give money to Porsche
Volkswagen: Give money to Volkswagen, we will make cheap car for people!

💰 Porsche receives money and unsubscribes:
Porsche received money!

📢 Second announcement - Porsche should NOT respond:
Lidership: we got more money!
Audi: Give money to Audi, we will make new electric audi!
Volkswagen: Give money to Volkswagen, we will make cheap car for people!

💰 Audi receives money and unsubscribes:
Audi received money!

📢 Third announcement - only Volkswagen should respond:
Lidership: we got more money!
Volkswagen: Give money to Volkswagen, we will make cheap car for people!
```

> ✨ **Demonstration**: Notice how after each company receives money and unsubscribes, they stop responding to future announcements. This shows the notification center correctly removes observers.

## Files
- `CustomNotificatinCenter.swift` - Main notification center implementation
- `CarConcern.swift` - Car companies observer example
- `main.swift` - Demo application
