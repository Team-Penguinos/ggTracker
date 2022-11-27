//
//  HomeCell.swift
//  ggTracker
//
//  Created by Paulina DeVito on 10/31/22.
//

import UIKit




class HomeCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var favoriteGameImage: UIImageView!
    @IBOutlet weak var favoriteGameStatus: UILabel!
    @IBOutlet weak var favoriteGameHours: UILabel!
    @IBOutlet weak var favoriteGameRating: UILabel!
    
    
    
    
    //MARK: - Default Cell Funcs
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
