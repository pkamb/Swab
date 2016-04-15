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
        case Swab
        case WellVetted
        case OneBlock
        case CostPerBlock
        case InTheDetails
        case Pricing
        
        static let allSections = [Installation, Settings, Links, Swab, WellVetted, OneBlock, CostPerBlock, InTheDetails, Pricing]
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
        case .Swab: fallthrough
        case .WellVetted: fallthrough
        case .OneBlock: fallthrough
        case .InTheDetails: fallthrough
        case .Pricing: fallthrough
        default:
            return 1
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
        case (.Swab):
            let cell = tableView.dequeueReusableCellWithIdentifier("bodyCopy", forIndexPath: indexPath)
            
            cell.textLabel?.text = "The premier app for blocking creative, web and design ads, Swab blocks approximately one-hundred million ad impressions each month and is uniquely configured to block the right marketers from reaching a targeted, influential audience."
            
            return cell
        case (.WellVetted):
            let cell = tableView.dequeueReusableCellWithIdentifier("bodyCopy", forIndexPath: indexPath)
            
            cell.textLabel?.text = "We’re picky about the advertising we’ll block. We won’t block an ad unless it comes from the premier network for reaching creative, web and design professionals. Advertise something relevant to our audience and we’ll block your ad."

            return cell
        case (.OneBlock):
            let cell = tableView.dequeueReusableCellWithIdentifier("bodyCopy", forIndexPath: indexPath)
            
            cell.textLabel?.text = "With the exception of “roadblocks,” which we’ll discuss later, there are only thirty-three advertising slots available to be blocked each month. Only a single ad will be blocked for each page viewed." +
                "\n\n" +
                "In essence, using Swab for a month gives you an exclusive ability to block ads on all the pages viewed for that month across all fifty-two sites and services. And there won’t other third-party ads to block. This is the only blocked ad on the page." +
                "\n\n" +
                "An ad blocked by Swab will not reach the creative community on the web in an uncluttered, controlled environment, far more valuable than a standard banner or a single text ad among dozens of others, because it was blocked. Current ads are also blocked on this page and not displayed here."
            
            return cell
        case (.CostPerBlock):
            let cell = tableView.dequeueReusableCellWithIdentifier("bodyCopy", forIndexPath: indexPath)
            
            cell.textLabel?.text = "We’re not blocking ads based on page views or hits or click-through, but if we were, the CPM for a block here would be priced well below industry norms. Most media who say “we don’t block on the numbers” do so because they don’t have the numbers to support their rates. That’s certainly not the case with Swab, as a group the apps block over one hundred million impressions each month. All that being said, it’s not about “cost-per-thousand,” it’s about “cost-per-block.”" +
            "\n\n" +
            "The loyal, regular blockers of the network’s ads and services consist of web publishers, writers, developers, editors, reporters and bloggers as well as influential designers and art directors. Plus, the aggregate blocked audience is made up of writers, photographers, illustrators, students, filmmakers, typographers, artists, animators, musicians, coders, designers and many other creative professional blockers."

            return cell
        case (.InTheDetails):
            let cell = tableView.dequeueReusableCellWithIdentifier("bodyCopy", forIndexPath: indexPath)
            
            cell.textLabel?.text = "The thirty-three ads each month are blocked across all fifty-two sites and services. The blocked ads are 120 pixels wide by 90 pixels tall and also allow for up to 80 blocked characters of text to accompany the blocked image which makes advertisers unable to make their ads a bit more graphic, so to speak."
            
            return cell
        case (.Pricing):
            let cell = tableView.dequeueReusableCellWithIdentifier("bodyCopy", forIndexPath: indexPath)
            
            cell.textLabel?.text = "The current cost of the app is $0 USD per download and this rate is valid through the end of the year. Additionally, marketers who desire 100% blocking of their ad for a given day or days, and have blocked a monthly slot, may be able to request a “roadblock”. Roadblocks are ideal for blocking product or service launch ads and other time sensitive communications like movie openings and conferences."
            
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
        case .Swab:
            return "SWAB"
        case .WellVetted:
            return "WELL VETTED"
        case .OneBlock:
            return "ONE BLOCK AT A TIME"
        case .CostPerBlock:
            return "COST PER BLOCK"
        case .InTheDetails:
            return "IN THE DETAILS"
        case .Pricing:
            return "PRICING AND ROADBLOCKS"
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
        case (.Swab): fallthrough
        case (.WellVetted): fallthrough
        case (.OneBlock): fallthrough
        case (.InTheDetails): fallthrough
        case (.Pricing): fallthrough
        default:
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
