//
//  SwabSettings.swift
//  swab
//
//  Created by Peter Kamb on 9/19/15.
//  Copyright © 2015 Knurling Group, LLC. All rights reserved.
//

import UIKit

enum Section: Int {
    case installation
    case settings
    case links
    
    var title: String {
        switch self {
        case .installation: return "INSTALLATION"
        case .settings:     return "SETTINGS"
        case .links:        return "LINKS"
        }
    }
    
    var cellIdentifier: String {
        switch self {
        case .installation: return "installation"
        case .settings:     return "swabSetting"
        case .links:        return "link"
        }
    }
    
    var numberOfRows: Int {
        switch self {
        case .installation: return 1
        case .settings:     return 1
        case .links:        return 4
        }
    }
}

enum Link: Int {
    case website
    case github
    case twitter
    case appStore
    
    var title: String {
        switch self {
        case .website:  return "Website"
        case .github:   return "GitHub"
        case .twitter:  return "Twitter"
        case .appStore: return "App Store"
        }
    }
    
    var url: URL {
        switch self {
        case .website:  return "http://swabthe.com"
        case .github:   return "https://github.com/pkamb/swab"
        case .twitter:  return "https://twitter.com/SwabThe"
        case .appStore: return "https://itunes.apple.com/us/app/swab-content-blocker-creative/id1042086002&mt=8"
        }
    }
    
    func open() {
        UIApplication.shared.openURL(url)
    }
}

extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: StaticString) {
        self = URL(string: "\(value)")!
    }
}

class SwabSettings: UITableViewController {
    
    @IBOutlet weak var headerText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerText.font = UIFont(name: "Georgia", size: (UIScreen.main.bounds.size.width <= 320) ? 24.0 : 28.0)
        self.tableView.backgroundColor = UIColor(red: 247/255.0, green:247/255.0, blue:247/255.0, alpha:1)
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return [Section.installation, Section.settings, Section.links].count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Section(rawValue: section)?.numberOfRows ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Section(rawValue: (indexPath as NSIndexPath).section)!
        
        let cell = tableView.dequeueReusableCell(withIdentifier: section.cellIdentifier, for: indexPath)
        
        switch section {
        case .installation:
            break
        case .settings:
            let switchControl = UISwitch(frame: CGRect.zero)
            switchControl.isOn = true
            switchControl.isEnabled = false
            cell.accessoryView = switchControl
        case .links:
            cell.textLabel?.text = Link(rawValue: indexPath.row)?.title
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Section(rawValue: section)?.title
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = Section(rawValue: indexPath.row) else {
            return
        }
        
        switch section {
        case .installation:
            self.present(SwabSettings.enableViaSettingsAlert(), animated: true, completion: nil)
        case .settings:
            break
        case .links:
            Link(rawValue: indexPath.row)?.open()
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    static func enableViaSettingsAlert() -> UIAlertController {
        let title   = "ENABLE VIA SETTINGS"
        let message = "Safari Content Blockers must be enabled via the Settings app"
                    + "\n\nSettings → Safari → Content Blockers"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "I'll Enable Swab Manually", style: .default, handler: nil)
        alert.addAction(action)
        
        return alert
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        
        if let headerView: UITableViewHeaderFooterView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.font = UIFont(name: "Verdana", size: 12.0)
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.tintColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}
