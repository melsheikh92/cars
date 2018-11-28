//
//  TableCell.swift
//  Cars
//
//  Created by Msheikh on 11/15/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import UIKit

class TableCell: UICollectionViewCell {
    @IBOutlet weak var stackHolder: UIStackView!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var leftItems: UILabel!
    
    @IBOutlet weak var bidsCount: UILabel!
    
    @IBOutlet weak var timeLeft: UILabel!
    
    @IBAction func btnFavoriteTapped(_ sender: Any) {
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         }

    func initCell(){
        self.stackHolder.separatorColor = UIColor(named: "grayColor")
        self.stackHolder.separatorLength = 25.0
        self.stackHolder.separatorThickness = 1.0
    }
    
}
