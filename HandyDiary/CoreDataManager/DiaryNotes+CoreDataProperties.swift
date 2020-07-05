//
//  DiaryNotes+CoreDataProperties.swift
//  HandyDiary
//
//  Created by Aditi Pancholi on 05/07/20.
//  Copyright © 2020 Aditi Mehta. All rights reserved.
//
//

import Foundation
import CoreData


extension DiaryNotes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DiaryNotes> {
        return NSFetchRequest<DiaryNotes>(entityName: "DiaryNotes")
    }

    @NSManaged public var diaryNote: String?
    @NSManaged public var timestemp: String?
    @NSManaged public var title: String?

}
