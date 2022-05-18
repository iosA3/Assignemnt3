//
//  HistoryViewController.swift
//  Film
//
//  Created by Matin on 2022/5/16.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var nameArr = [String]()
    var priceArr = [String]()
    var timeArr = [String]()
    var roomArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.customTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadData()
    }
    
    func loadData() {
        if let arr = UserDefaults.standard.value(forKey: "name") as? Array<String> {
            nameArr = arr
        }
        
        if let arr = UserDefaults.standard.value(forKey: "price") as? Array<String> {
            priceArr = arr
        }
        
        if let arr = UserDefaults.standard.value(forKey: "room") as? Array<String> {
            roomArr = arr
        }
        
        if let arr = UserDefaults.standard.value(forKey: "time") as? Array<String> {
            timeArr = arr
        }
        
        self.tableView.reloadData()
    }
    
    func customTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.nameArr.count)
    }
    
    // 行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.movieImg.image = UIImage.init(named: self.nameArr[indexPath.row])
        cell.movieNameLab.text = self.nameArr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detail", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ctrl = segue.destination as! MovieBookingViewController
        ctrl.isDetail = true
        ctrl.index = sender as! Int
        ctrl.priceArr = self.priceArr
        ctrl.nameArr = self.nameArr
        ctrl.roomArr = self.roomArr
        ctrl.timeArr = self.timeArr
        ctrl.priceStr = self.priceArr[sender as! Int]
        ctrl.timeStr = self.timeArr[sender as! Int]
        ctrl.roomStr = self.roomArr[sender as! Int]
        ctrl.imgNameStr = self.nameArr[sender as! Int]
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
