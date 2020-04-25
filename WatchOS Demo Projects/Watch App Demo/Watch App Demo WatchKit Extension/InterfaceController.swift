//
//  InterfaceController.swift
//  Watch App Demo WatchKit Extension
//
//  Created by Hadži Lazar Pešić on 25/04/2020.
//  Copyright © 2020 Hadži Lazar Pešić. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var counterLabel: WKInterfaceLabel!
    
    fileprivate var counter = 0
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func buttonPressed() {
        counter += 1
        counterLabel.setText("\(counter)")
    }
}
