//
//  DatabaseModels.swift
//  HandyDiary
//
//  Created by Aditi Pancholi on 13/04/20.
//  Copyright © 2020 Aditi Mehta. All rights reserved.
//

import Foundation
import UIKit

struct ModelDiaryNote{
    var timestemp : Date
    var title : String
    var diaryNote : String
    
    init(timestemp : String,title :String, diaryNote : String) {
        self.title = title
        self.diaryNote = diaryNote
        self.timestemp = timestemp.convertTimeStempIntoDate()
    }
    
    enum CodingKeys: String, CodingKey {
        case timestemp = "timestemp"
        case title = "title"
        case diaryNote = "diaryNote"
    }
}
