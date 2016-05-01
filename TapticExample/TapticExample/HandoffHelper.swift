//
//  HandoffHelper.swift
//  TapticExample
//
//  Created by Luís Resende on 23/03/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import UIKit

class HandoffHelper: NSObject {
    
}

struct Handoff {
    enum ActivityType: String {
        case Detail = "br.com.luisresende.detail"
    }
    
    let activityValueKey = "activityValue"
}
