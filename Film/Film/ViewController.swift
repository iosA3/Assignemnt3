//
//  ViewController.swift
//  Film
//
//  Created by Matin on 2022/5/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topImg: UIImageView!
    @IBOutlet weak var bookBtn: UIButton!
    @IBOutlet weak var historyBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.topImg.setViewAllCorner(radius: 5)
        self.bookBtn.setViewAllCorner(radius: 22)
        self.historyBtn.setViewAllCorner(radius: 22)
    }


}

