//
//  DateExtension.swift
//  URLSession-Task
//
//  Created by Jeremiah on 02/06/17.
//  Copyright © 2017 Jeremiah. All rights reserved.
//

import Foundation
import UIKit
extension UILabel{
     func dateString(_ dateString: String){
        let dateFor: DateFormatter = DateFormatter()
        dateFor.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
       let yourDate: NSDate? = dateFor.date(from: dateString)! as NSDate
        let dateFormat: DateFormatter = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
         self.text = dateFormat.string(from: yourDate! as Date)

    }
}
