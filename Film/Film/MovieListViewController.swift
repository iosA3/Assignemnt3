//
//  MovieListViewController.swift
//  Film
//
//  Created by Matin on 2022/5/15.
//

import UIKit

class MovieListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let nameArr = ["Superman","Batman","Spiderman"]
    let imgArr = ["Superman","Batman","Spiderman"]
    let priceArr = ["$30","$42","$36"]
    let timeArr = ["18:20","20:00","21:30"]
    let roomArr = ["1 hall","3 hall","2 hall"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.customTableView()
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
        cell.movieImg.image = UIImage.init(named: self.imgArr[indexPath.row])
        cell.movieNameLab.text = self.nameArr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "booking", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ctrl = segue.destination as! MovieBookingViewController
        ctrl.priceStr = self.priceArr[sender as! Int]
        ctrl.timeStr = self.timeArr[sender as! Int]
        ctrl.roomStr = self.roomArr[sender as! Int]
        ctrl.imgNameStr = self.imgArr[sender as! Int]
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
