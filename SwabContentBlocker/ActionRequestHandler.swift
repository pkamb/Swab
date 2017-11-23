//
//  ActionRequestHandler.swift
//  SwabContentBlocker
//
//  Created by Peter Kamb on 9/19/15.
//  Copyright © 2015 Knurling Group, LLC. All rights reserved.
//

import UIKit
import MobileCoreServices

class ActionRequestHandler: NSObject, NSExtensionRequestHandling {

    func beginRequest(with context: NSExtensionContext) {
        var items = [NSExtensionItem]()
        
        if let attachment = NSItemProvider(contentsOf: Bundle.main.url(forResource: "blockerList", withExtension: "json")) {
            let item = NSExtensionItem()
            item.attachments = [attachment]
            items.append(item)
        }
        
        context.completeRequest(returningItems:items, completionHandler: nil);
    }
    
}
