//
//  skillCell.swift
//  LoginScreen
//
//  Created by Станислав Буйновский on 29.10.2021.
//

import UIKit

class SkillCell: UITableViewCell {

    
    @IBOutlet weak var skillTitle: UILabel!
    @IBOutlet weak var skillDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
