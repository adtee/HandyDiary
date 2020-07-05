//
//  ExtnesionDate.swift
//  HandyDiary
//
//  Created by Aditi Pancholi on 13/04/20.
//  Copyright © 2020 Aditi Mehta. All rights reserved.
//

import Foundation

extension Date{
    
        func currentTimeMillis() -> Int64 {
            return Int64(self.timeIntervalSince1970 * 1000)
        }
}
