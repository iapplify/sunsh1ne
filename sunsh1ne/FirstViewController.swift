//
//  FirstViewController.swift
//  sunsh1ne
//
//  Created by Taylor Jackson on 2015-07-05.
//  Copyright (c) 2015 iApplify. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var eventTable: UITableView!
    
    var eventNameInput: UITextField?
    @IBAction func addParticipant(sender: AnyObject) {
        var alert = UIAlertController(title: "New Event", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Enter", style: UIAlertActionStyle.Default, handler: someHandler))
        alert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "Event Name"
            self.eventNameInput = textField
        })
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func someHandler(alert: UIAlertAction!) {
        println(self.eventNameInput!.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

