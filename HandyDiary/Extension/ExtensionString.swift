//
//  ExtensionString.swift
//  HandyDiary
//
//  Created by Aditi Pancholi on 13/04/20.
//  Copyright © 2020 Aditi Mehta. All rights reserved.
//

import Foundation


extension String{
    
    func convertTimeStempIntoDate(dateFormatter : String = "yyyy-MM-dd HH:mm") -> Date{
        
        let date = Date(timeIntervalSince1970: Double(self) ?? Double(Date().currentTimeMillis()))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        let dateString = dateFormatter.string(from: date)
        return dateFormatter.date(from: dateString) ?? Date()
    }
}
