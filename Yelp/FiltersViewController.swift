//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Peyt Spencer Dewar on 1/27/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol FiltersViewControllerDelegate {
    func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: [String:AnyObject])
}

class FiltersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SwitchCellDelegate {

    @IBOutlet weak var filterTable: UITableView!
    weak var delegate: FiltersViewControllerDelegate?

    var categories: [[String:String]]!
    var switchStates = [Int:Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        categories = yelpCategories()
        
        filterTable.dataSource = self
        filterTable.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onSearch(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
        var filters = [String : AnyObject]()
        var selectedCategories = [String]()
        
        for (row, isSelected) in switchStates {
            if isSelected {
                selectedCategories.append(categories[row]["code"]!)
            }
        }
        
        if selectedCategories.count > 0 {
            filters["categories"] = selectedCategories
        }
        
        delegate?.filtersViewController(self, didUpdateFilters: filters)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = filterTable.dequeueReusableCellWithIdentifier("SwitchCell", forIndexPath: indexPath) as! SwitchCell
        
        cell.switchLabel.text = categories[indexPath.row]["name"]
        cell.delegate = self
        
        //preserves the switch states
        if switchStates[indexPath.row] != nil {
            cell.onSwitch.on = switchStates[indexPath.row]!
        } else {
            cell.onSwitch.on = false
        }
        
        //OR
        /*
        cell.onSwitch.on = switchStates[indexPath.row] ?? false
        */
        
        
        return cell
    }
    
    func switchCell(switchCell: SwitchCell, didChangeValue value: Bool) {
        let indexPath = filterTable.indexPathForCell(switchCell)!
        switchStates[indexPath.row] = value
    }
    
    func yelpCategories() -> [[String:String]] {
        return [["name" : "Afghan", "code": "afghani"],
            ["name" : "African", "code": "african" ],
            ["name" : "American New", "code": "newamerican" ],
            ["name" : "American Traditional", "code": "african" ],
            ["name" : "African", "code": "african" ],
            ["name" : "African", "code": "african" ],
            ["name" : "African", "code": "african" ],
            ["name" : "African", "code": "african" ],
            ["name" : "African", "code": "african" ],
            ["name" : "African", "code": "african" ],
            ["name" : "African", "code": "african" ],
            ["name" : "African", "code": "african" ],
            ["name" : "African", "code": "african" ],
            ["name" : "African", "code": "african" ],
            ["name" : "African", "code": "african" ],
            ["name" : "African", "code": "african" ],
            ["name" : "African", "code": "african" ],
            ["name" : "African", "code": "african" ],
            ["name" : "African", "code": "african" ],
            ["name" : "African", "code": "african" ],
            ["name" : "African", "code": "african" ],
            ["name" : "African", "code": "african" ],
            ["name" : "African", "code": "african" ]]
    }

}
