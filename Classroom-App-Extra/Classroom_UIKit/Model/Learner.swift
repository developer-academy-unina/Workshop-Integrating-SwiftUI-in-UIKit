//
//  Learner.swift
//  Classroom_UIKit
//
//  Created by Giovanni Monaco on 31/01/22.
//

import Foundation
import UIKit

struct Learner {
    var name: String
    var surname: String
    var imageName: String {
        "\(name.lowercased())_\(surname.lowercased())"
    }
    var description: String?
    var favouriteColor: UIColor?
}
