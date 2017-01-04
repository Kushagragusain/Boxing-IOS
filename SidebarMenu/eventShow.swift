//
//  eventShow.swift
//  Boxing
//
//  Created by Kushagra Gusain on 10/08/16.
//  Copyright © 2016 Kushagra. All rights reserved.
//

import Foundation
import UIKit

class eventShow: UIViewController, UITableViewDelegate,UITableViewDataSource{
   
    
    @IBOutlet weak var tableView: UITableView!
    var TableData:NSDictionary = [:]
    var componentArray :[String] = []
   
    var idEvent = [String]()
    var placeEvent = [String]()
    var startTime = [String]()
    var nameOne = [String]()
    var nameTwo = [String]()
    var countofx = Int()
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        let myUrl = NSURL(string: "http:boxing.farcon.in/allevents");
        
        let request = NSMutableURLRequest(URL:myUrl!);
        
        request.HTTPMethod = "POST";// Compose a query string
        
        let postString = "" ;
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            // You can print out response object
            
            //print("response = \(response)")
            
            // Print out response body
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
            //  print("responseStringsignup = \(responseString!)")
            //Let's convert response sent from a server side script to a NSDictionary object:
            
         
            
            do {
                let myJSON =  try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSArray
                
                
                for x in myJSON! {
                    self.countofx = myJSON!.count
                    print(self.countofx)
                    if let item = x as? [String: AnyObject] {
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            
                            var x = item["id"] as! NSNumber
                            self.idEvent.append("\(x)")
                            self.placeEvent.append((item["place"] as? String)!)
                            self.startTime.append((item["start_time"] as? String)!)
                            self.nameTwo.append((item["name2"] as? String)!)
                            self.nameOne.append((item["name1"] as? String)!)
                            
                        })
                    }
                }
                /*if let list = myJSON as? NSArray{

                        for (var i = 0; i < list.count ; i++ ){
                    
                                if let data_block = list[i] as? NSDictionary
                                {
                                    //self.TableData = data_block
                                    if let id = data_block["id"] as? String{
                                        if let place = data_block["place"] as? String{
                                            if let starttime = data_block["start_time"] as? String{
                                                if let nameone = data_block["name1"] as? String{
                                                    if let nametwo = data_block["name2"] as? String{
                                                        self.idEvent.append(id)
                                                        self.placeEvent.append(place)
                                                        self.startTime.append(starttime)
                                                        self.nameOne.append(nameone)
                                                        self.nameTwo.append(nametwo)
                                        
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                           }
                }*/

            }
            
            catch {
             print(error)
             }
            
        }
        
        
        task.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
 
        func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
   
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
            
        return countofx
    }
    
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! eventShowCell
        var data = self.TableData[indexPath.row]
        
            
            cell.textLabel?.text = self.idEvent[indexPath.row] as! String
            
        
        return cell
    }
    
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
    

  
}

