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
    
    fileprivate enum Section: Int {
        case installation
        case settings
        case links
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerText!.font = UIFont(name: "Georgia", size: (UIScreen.main.bounds.size.width <= 320) ? 24.0 : 28.0)
        self.tableView.backgroundColor = UIColor(red: 247/255.0, green:247/255.0, blue:247/255.0, alpha:1)
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return [Section.installation, Section.settings, Section.links].count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else {
            return 0
        }
        
        switch section {
        case .installation: return 1
        case .settings:     return 1
        case .links:        return 4
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Section(rawValue: (indexPath as NSIndexPath).section)!
        
        let cell: UITableViewCell
        
        switch (section) {
        case (.installation):
            cell = tableView.dequeueReusableCell(withIdentifier: "installation", for: indexPath)
        case (.settings):
            cell = tableView.dequeueReusableCell(withIdentifier: "swabSetting", for: indexPath)
            
            let switchControl = UISwitch(frame: CGRect.zero)
            switchControl.isOn = true
            switchControl.isEnabled = false
            cell.accessoryView = switchControl
        case (.links):
            cell = tableView.dequeueReusableCell(withIdentifier: "link", for: indexPath)
            
            switch (indexPath as NSIndexPath).row {
            case 0: cell.textLabel?.text = "Website"
            case 1: cell.textLabel?.text = "GitHub"
            case 2: cell.textLabel?.text = "Twitter"
            case 3: cell.textLabel?.text = "App Store"
            default: break
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = Section(rawValue: section)!
        
        switch section {
        case .installation: return "INSTALLATION"
        case .settings:     return "SETTINGS"
        case .links:        return "LINKS"
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = Section(rawValue: (indexPath as NSIndexPath).section)!
        
        switch (section) {
        case (.installation):
            let title = "ENABLE VIA SETTINGS"
            var message = "Safari Content Blockers must be enabled via the Settings app"
            message += "\n\nSettings → Safari → Content Blockers"
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let action = UIAlertAction(title: "I'll Enable Swab Manually", style: .default, handler: nil)
            alert.addAction(action)
            
            self.present(alert, animated: true, completion: nil)
            
            // This URL will open the app's Settings page, not the Settings.app main page.
            // In iOS 8+ the app Settings page is installed automatically/randomly.
            //UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
            
        case (.settings):
            // TODO: toggle Content Blocking via this switch?
            break
        case (.links):
            var urlString:String
            
            switch (indexPath as NSIndexPath).row {
            case 0: urlString = "http://swabthe.com"
            case 1: urlString = "https://github.com/pkamb/swab"
            case 2: urlString = "https://twitter.com/SwabThe"
            case 3: urlString = "https://itunes.apple.com/us/app/swab-content-blocker-creative/id1042086002&mt=8"
            default:urlString = ""
            }
            
            UIApplication.shared.openURL(URL(string: urlString)!)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor(red: 247/255.0, green:247/255.0, blue:247/255.0, alpha:1)

        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.font = UIFont(name: "Verdana", size: 12.0)
    }
    
    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.tintColor = UIColor(red: 247/255.0, green:247/255.0, blue:247/255.0, alpha:1)
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}
