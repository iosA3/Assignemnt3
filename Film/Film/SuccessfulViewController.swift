//
//  SuccessfulViewController.swift
//  Film
//
//  Created by Matin on 2022/5/16.
//

import UIKit

class SuccessfulViewController: UIViewController {

    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var priceLab: UILabel!
    @IBOutlet weak var timeLab: UILabel!
    @IBOutlet weak var roomLab: UILabel!
    var priceStr : String!
    var timeStr : String!
    var roomStr : String!
    var imgNameStr : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.imgNameStr
        self.priceLab.text = self.priceStr
        self.timeLab.text = self.timeStr
        self.roomLab.text = self.roomStr
        self.movieImg.image = UIImage.init(named: self.imgNameStr)
        self.movieImg.setViewAllCorner(radius: 5)
    }
    
    @IBAction func bookingMoveAction(_ sender: UIButton) {
        let listCtrl = MovieListViewController()
        var targetCtrl : UIViewController!
        for controller in self.navigationController!.viewControllers {
            if controller.isKind(of: listCtrl.classForCoder) {
                targetCtrl = controller
            }
        }
        if targetCtrl != nil {
            self.navigationController?.popToViewController(targetCtrl, animated: true)
        }
    }
    
    @IBAction func homeAction(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
