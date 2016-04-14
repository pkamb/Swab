//
//  SwabSettings.swift
//  swab
//
//  Created by Peter Kamb on 9/19/15.
//  Copyright © 2015 Knurling Group, LLC. All rights reserved.
//

import UIKit

class SwabSettings: UITableViewController {
    
    @IBOutlet weak var headerText: UITextView?
    
    private enum Section: Int {
        case Installation
        case Settings
        case Links
        
        static let allSections = [Installation, Settings, Links]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UIScreen.mainScreen().bounds.size.width <= 320) {
            headerText!.font = UIFont(name: "Georgia", size: 24.0)
        } else {
            headerText!.font = UIFont(name: "Georgia", size: 28.0)
        }
        
        self.tableView.backgroundColor = UIColor(red: 247/255.0, green:247/255.0, blue:247/255.0, alpha:1)
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return Section.allSections.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = Section(rawValue: section)!
        
        switch section {
        case .Installation:
            return 1
        case .Settings:
            return 1
        case .Links:
            return 4
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = Section(rawValue: indexPath.section)!
        
        switch (section) {
        case (.Installation):
            let cell = tableView.dequeueReusableCellWithIdentifier("installation", forIndexPath: indexPath)
            
            return cell
        case (.Settings):
            let cell = tableView.dequeueReusableCellWithIdentifier("swabSetting", forIndexPath: indexPath)
            
            let switchControl = UISwitch(frame: CGRectZero)
            switchControl.on = true
            switchControl.enabled = false
            cell.accessoryView = switchControl
            
            return cell
        case (.Links):
            let cell = tableView.dequeueReusableCellWithIdentifier("link", forIndexPath: indexPath)
            
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Website"
            case 1:
                cell.textLabel?.text = "GitHub"
            case 2:
                cell.textLabel?.text = "Twitter"
            case 3:
                cell.textLabel?.text = "App Store"
            default:
                break
            }
            
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = Section(rawValue: section)!
        
        switch section {
        case .Installation:
            return "INSTALLATION"
        case .Settings:
            return "SETTINGS"
        case .Links:
            return "LINKS"
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let section = Section(rawValue: indexPath.section)!
        
        switch (section) {
        case (.Installation):
            let title = "ENABLE VIA SETTINGS"
            var message = "Safari Content Blockers must be enabled via the Settings app"
            message += "\n\nSettings → Safari → Content Blockers"
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            
            let action = UIAlertAction(title: "I'll Enable Swab Manually", style: .Default, handler: nil)
            alert.addAction(action)
            
            self.presentViewController(alert, animated: true, completion: nil)
            
            // This URL will open the app's Settings page, not the Settings.app main page.
            // In iOS 8+ the app Settings page is installed automatically/randomly.
            //UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
        case (.Settings):
            
            // TODO: toggle Content Blocking via this switch?
            
            break
        case (.Links):
            var urlString:String
            
            switch indexPath.row {
            case 0:
                urlString = "http://swabthe.com"
            case 1:
                urlString = "https://github.com/pkamb/swab"
            case 2:
                urlString = "https://twitter.com/SwabThe"
            case 3:
                urlString = "https://itunes.apple.com/us/app/swab-content-blocker-creative/id1042086002&mt=8"
            default:
                urlString = ""
                break
            }
            
            UIApplication.sharedApplication().openURL(NSURL(string: urlString)!)
            
            break
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor(red: 247/255.0, green:247/255.0, blue:247/255.0, alpha:1)

        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.font = UIFont(name: "Verdana", size: 12.0)
    }
    
    override func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.tintColor = UIColor(red: 247/255.0, green:247/255.0, blue:247/255.0, alpha:1)
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}
