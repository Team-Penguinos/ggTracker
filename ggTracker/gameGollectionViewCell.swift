//
//  gameGollectionViewCell.swift
//  ggTracker
//
//  Created by Kyle Deveaux on 11/7/22.
//

import UIKit

class gameGollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var gameImageView: UIImageView!
    
    
    //Game is for the api being called 
    func setup(with game: Game){
        gameImageView.image = game.image
    }
    
    
    
}
