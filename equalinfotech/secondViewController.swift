//
//  secondViewController.swift
//  equalinfotech
//
//  Created by STC on 08/02/23.
//

import UIKit
import SDWebImage
class secondViewController: UIViewController {
    
    
    @IBOutlet weak var proImage: UIImageView!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var idLabel: UILabel!
    
    
    @IBOutlet weak var additionalInfomation: UITextView!
    var dataFromFVC1: String?
    var dataFromFVC2: String?
    var dataFromFVC3: String?
    var dataFromFVC4: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        proImage.layer.masksToBounds = true
        proImage.layer.cornerRadius = 50
        proImage.layer.borderColor = UIColor.orange.cgColor
        self.NameLabel.text = dataFromFVC1
        //let imgUrl = NSURL(string: dataFromFVC2!)
        //proImage.sd_setImage(with: imgUrl as URL?)
        self.idLabel.text = dataFromFVC3
        self.additionalInfomation.text = dataFromFVC4
       
    }
    

   

}
