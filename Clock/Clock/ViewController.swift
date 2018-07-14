//
//  ViewController.swift
//  Clock
//
//  Created by Kristina Neuwirth on 6/12/18.
//  Copyright © 2018 Kristina Neuwirth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var h1: ClockView!
    @IBOutlet weak var h2: ClockView!
    @IBOutlet weak var dots: BlinkingTimerView!
    @IBOutlet weak var m1: ClockView!
    @IBOutlet weak var m2: ClockView!
    @IBOutlet weak var s1: ClockView!
    @IBOutlet weak var s2: ClockView!
    @IBOutlet weak var ap: ClockView!
    @IBOutlet weak var mm: ClockView!
    
    
    var showDots: Bool = false
    
    
    
    private struct TimeFormat {
        static let twelveHourFormat = "hh:mm:ss a"
        static let twentyFourHourFormat = "HH:mm:ss"
    }
    
    private let dateFormatter: DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.dateFormat = TimeFormat.twelveHourFormat
        return formatter
        
    }()
    
    var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        startTimer()
        
    }
    
    func blinking () {
        
        
        if showDots {
            print("HEY")
            dots.dots.isHidden = false
            showDots = false
        } else {
            dots.dots.isHidden = true
            showDots = true
            
            
        }
    }
    
    
    
    
    private func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: {[weak self] _ in guard  self != nil else {return}
                
                guard let currentDate = self?.dateFormatter.string(from: Date()) else {return}
                var dateArray = [Character]()
                for char in currentDate {
                    dateArray.append(char)
                    print(char)
                    
                }
                self?.h1.updateDigit(digit: dateArray[0])
                self?.h2.updateDigit(digit: dateArray[1])
                self?.m1.updateDigit(digit: dateArray[3])
                self?.m2.updateDigit(digit: dateArray[4])
                self?.s1.updateDigit(digit: dateArray[6])
                self?.s2.updateDigit(digit: dateArray[7])
                self?.ap.updateDigit(digit: dateArray[9])
                self?.mm.updateDigit(digit: dateArray[10])
                
                self?.blinking()
                print(currentDate)
            })
            
        } else {
            
            stopTimer()
            startTimer()
        }
    }
    
    
    func stopTimer () {
        
        if timer != nil {
            timer!.invalidate()
            timer = nil
            
        }
        
    }
    
}

//    extension UserDefaults {
//        func setColor(color: UIColor?, forKey key: String) {
//            var colorData: NSData?
//            if let color = color {
//            colorData = NSKeyedArchiver.archivedData(withRootObject: color) as NSData?
//        }
//
//
//            set(colorData, forKey: key)// UserDefault Built-in Method into Any?
//    }
//}
//    extension UserDefaults {
//        func colorForKey(key: String) -> UIColor? {
//            var color: UIColor?
//            if let colorData = data(forKey: key) {
//            color = NSKeyedUnarchiver.unarchiveObject(with: colorData) as? UIColor
//        }
//
//
//            return color
//    }
//
//
//    }
//
//        defaults.setColor(color: UIColor.red, forKey: "myColor") // set
//        let myColor = defaults.colorForKey(key: "myColor") // get
//
//

