
import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var eventTable: UITableView!
    
    var events = [String]()
    var eventNameInput: UITextField?
    
    
    @IBAction func addParticipant(sender: AnyObject) {
        var alert = UIAlertController(title: "New Event", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Enter", style: UIAlertActionStyle.Default, handler: addParticpantHelper))
        alert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "Event Name"
            self.eventNameInput = textField
        })
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    func addParticpantHelper(alert: UIAlertAction!) {
        self.events.append(self.eventNameInput!.text)
        self.eventTable.reloadData()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = self.events[indexPath.row]
        let cell = eventTable.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel!.text = item
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }

    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {

        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            events.removeAtIndex(indexPath.row)
            eventTable.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    func getEvents() -> [String] {
        return self.events
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.eventTable.delegate = self;
        self.eventTable.dataSource = self;
        self.eventTable.allowsMultipleSelectionDuringEditing = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

