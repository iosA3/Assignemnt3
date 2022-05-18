//
//  MovieBookingViewController.swift
//  Film
//
//  Created by Matin on 2022/5/15.
//

import UIKit

class MovieBookingViewController: UIViewController {

    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var priceLab: UILabel!
    @IBOutlet weak var timeLab: UILabel!
    @IBOutlet weak var roomLab: UILabel!
    @IBOutlet weak var confirmBtn: UIButton!
    var priceStr : String!
    var timeStr : String!
    var roomStr : String!
    var imgNameStr : String!
    var nameArr = [String]()
    var priceArr = [String]()
    var timeArr = [String]()
    var roomArr = [String]()
    var isDetail = false
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.imgNameStr
        self.priceLab.text = self.priceStr
        self.timeLab.text = self.timeStr
        self.roomLab.text = self.roomStr
        self.movieImg.image = UIImage.init(named: self.imgNameStr)
        self.movieImg.setViewAllCorner(radius: 5)
        self.confirmBtn.setViewAllCorner(radius: 22)
        
        if self.isDetail {
            self.confirmBtn.setTitle("Cancel", for: .normal)
        }
    }
    
    @IBAction func bookingMovieAction(_ sender: UIButton) {
        if self.isDetail {
            self.nameArr.remove(at: index)
            self.priceArr.remove(at: index)
            self.timeArr.remove(at: index)
            self.roomArr.remove(at: index)
            self.navigationController?.popViewController(animated: true)
            UserDefaults.standard.set(nameArr, forKey: "name")
            UserDefaults.standard.set(priceArr, forKey: "price")
            UserDefaults.standard.set(timeArr, forKey: "time")
            UserDefaults.standard.set(roomArr, forKey: "room")
            return
        }
        var nameArr = [String]()
        var priceArr = [String]()
        var timeArr = [String]()
        var roomArr = [String]()
        if let arr = UserDefaults.standard.value(forKey: "name") as? Array<String> {
            nameArr = arr
            nameArr.append(self.imgNameStr)
        }else{
            nameArr.append(self.imgNameStr)
        }
        UserDefaults.standard.set(nameArr, forKey: "name")
        
        if let arr = UserDefaults.standard.value(forKey: "price") as? Array<String> {
            priceArr = arr
            priceArr.append(self.priceStr)
        }else{
            priceArr.append(self.priceStr)
        }
        UserDefaults.standard.set(priceArr, forKey: "price")
        
        if let arr = UserDefaults.standard.value(forKey: "room") as? Array<String> {
            roomArr = arr
            roomArr.append(self.roomStr)
        }else{
            roomArr.append(self.roomStr)
        }
        UserDefaults.standard.set(roomArr, forKey: "room")
        
//        let currentTime = DateTool.getCurrentTime(timeFormat: TimeFormat.YYYYMMDD)
//        let time = "\(currentTime) \(self.timeStr ?? "00:00"):00"
        if let arr = UserDefaults.standard.value(forKey: "time") as? Array<String> {
            timeArr = arr
            timeArr.append(timeStr)
        }else{
            timeArr.append(timeStr)
        }
        UserDefaults.standard.set(timeArr, forKey: "time")
        
        performSegue(withIdentifier: "successful", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ctrl = segue.destination as! SuccessfulViewController
        ctrl.priceStr = self.priceStr
        ctrl.timeStr = self.timeStr
        ctrl.roomStr = self.roomStr
        ctrl.imgNameStr = self.imgNameStr
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
