//
//  SwabSettings.swift
//  swab
//
//  Created by Peter Kamb on 9/19/15.
//  Copyright © 2015 Knurling Group, LLC. All rights reserved.
//

import UIKit

class SwabSettings: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor(red: 247/255.0, green:247/255.0, blue:247/255.0, alpha:1)
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            let cell = tableView.dequeueReusableCellWithIdentifier("installation", forIndexPath: indexPath)
            return cell
        case (1, 0):
            let cell = tableView.dequeueReusableCellWithIdentifier("swabSetting", forIndexPath: indexPath)
            
            let switchControl = UISwitch(frame: CGRectZero)
            switchControl.on = true
            switchControl.enabled = false
            cell.accessoryView = switchControl
            
            return cell
        default:
            let cell = UITableViewCell.init(style: .Default, reuseIdentifier: nil)
            return cell;
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Installation"
        case 1:
            return "Settings"
        default:
            return nil
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.section == 0 && indexPath.row == 0) {
            UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
        }
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor(red: 247/255.0, green:247/255.0, blue:247/255.0, alpha:1)

        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.font = UIFont.systemFontOfSize(16.0)
    }
    
    override func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.tintColor = UIColor(red: 247/255.0, green:247/255.0, blue:247/255.0, alpha:1)
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40.0
    }

}
