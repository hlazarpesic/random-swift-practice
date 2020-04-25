//
//  InterfaceController.swift
//  Tip Calculator WatchKit Extension
//
//  Created by Hadži Lazar Pešić on 25/04/2020.
//  Copyright © 2020 Hadži Lazar Pešić. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var mealValue: WKInterfaceLabel!
    @IBOutlet weak var tenTip: WKInterfaceLabel!
    @IBOutlet weak var fifteenTip: WKInterfaceLabel!
    @IBOutlet weak var twentyTip: WKInterfaceLabel!
    @IBOutlet weak var tenTipTotal: WKInterfaceLabel!
    @IBOutlet weak var fifteenTipTotal: WKInterfaceLabel!
    @IBOutlet weak var twentyTipTotal: WKInterfaceLabel!
    
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

    @IBAction func changeOfMealValue(_ value: Float) {
        mealValue.setText("$\(value)")
        
        tenTip.setText(String(format: "$%.01f", value * 0.1))
        fifteenTip.setText(String(format: "$%.01f", value * 0.15))
        twentyTip.setText(String(format: "$%.01f", value * 0.2))
        
        tenTipTotal.setText(String(format: "$%.01f", value + value * 0.1))
        fifteenTipTotal.setText(String(format: "$%.01f", value + value * 0.15))
        twentyTipTotal.setText(String(format: "$%.01f", value + value * 0.2))
    }
}
