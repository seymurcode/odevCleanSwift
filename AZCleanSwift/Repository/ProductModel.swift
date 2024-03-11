//
//  ProductModel.swift
//  AZCleanSwift
//
//  Created by Seymur Askarov on 11.03.24.
//

import Foundation
import RealmSwift

class ProductModel: Object {
   @Persisted(primaryKey: true) var _id: ObjectId
   @Persisted var title: String = ""
   @Persisted var desc: String = ""
   convenience init(title: String, description: String) {
       self.init()
       self.title = title
       self.desc = description
   }
}
