//
//  LearnersTableViewCell.swift
//  Classroom_UIKit
//
//  Created by Giovanni Monaco on 31/01/22.
//

import UIKit

class LearnersTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var profileView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .disclosureIndicator
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(with learner: Learner) {
        nameLabel.text = learner.name + " " + learner.surname
        if let image = UIImage(named: learner.imageName) {
            profileView.image = image
        } else {
            profileView.image = UIImage(named: "empty")
        }
    }
    
}
