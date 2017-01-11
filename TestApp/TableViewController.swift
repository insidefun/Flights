//
//  TableViewController.swift
//  TestApp
//
//  Created by insidefun on 05.01.17.
//  Copyright © 2017 insidefun. All rights reserved.
//

import UIKit
import SwiftyJSON

class TableViewController: UITableViewController {
    
    let indicator:UIActivityIndicatorView = UIActivityIndicatorView  (activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    //var flights: FlightsModel? = nil
    var tickets: [TicketModel] = []

    func loadJsonFromUrl() {
        
        let url = "http://www.jesuscodes.me/flights/list?origin=tlv";
        
        URLSession.shared.dataTask(with: NSURL(string: url)! as URL, completionHandler: {
            (data, response, error) -> Void in
            
            if(error == nil && data != nil) {
                do {
                    let json = JSON(try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:AnyObject])
                    
                    print(json)
                    
                    if let tickets = (json["tickets"].array?.map {return TicketModel.build(json: $0)}) {
                        self.tickets = tickets as! [TicketModel]
                    }
                    
                    self.tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
                    self.tableView.reloadData()
                    
//                    self.flights = FlightsModel.build(json: testJson)
//                    print("tickets: \(self.flights?.tickets[0].price)) \n cities: \(self.flights?.cities[0].country)")
                } catch {
                    print("bad json")
                }
            } else {
                print("ERROR: \(error?.localizedDescription)")
            }
            
            self.hideActivityIndicator()
        }).resume();
    }
    
    func showActivityIndicator() {
        indicator.color = UIColor.gray
        indicator.frame = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 10, height: 10))
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.bringSubview(toFront: self.view)
        indicator.isHidden = false
        indicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        showActivityIndicator()
        
        loadJsonFromUrl()
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.tickets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CardViewCell
        // Configure the cell...
        
        cell.priceView.text = "$\(Int(tickets[indexPath.row].price))"
        
        let correctFormat = DateFormatter()
        correctFormat.dateFormat = "d MMM"

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        cell.departDateView.text = correctFormat.string(from: formatter.date(from: tickets[indexPath.row].departDate)!)
        cell.returnDateView.text = correctFormat.string(from: formatter.date(from: tickets[indexPath.row].returnDate)!)
        
        cell.departView.text = "\(tickets[indexPath.row].origin) -> \(tickets[indexPath.row].destination)"
        cell.returnView.text = "\(tickets[indexPath.row].destination) -> \(tickets[indexPath.row].origin)"

    
        return cell
    }
}
