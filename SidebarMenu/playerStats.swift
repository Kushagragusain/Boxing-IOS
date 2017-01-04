//
//  playerStats.swift
//  Boxing
//
//  Created by Kushagra Gusain on 12/08/16.
//  Copyright © 2016 Kushagra. All rights reserved.
//

import Foundation
import UIKit

class playerStats: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var leftPlayerPic: UIImageView!
    @IBOutlet weak var rightPlayerPic: UIImageView!
    @IBOutlet weak var leftPlayerName: UILabel!
    @IBOutlet weak var rightPlayerName: UILabel!
   
    @IBOutlet weak var leftPlayerTotFight: UILabel!
    @IBOutlet weak var rightPlayerTotFight: UILabel!
    @IBOutlet weak var leftPlayerAge: UILabel!
    @IBOutlet weak var rightPlayerAge: UILabel!
    @IBOutlet weak var leftPlayerHeight: UILabel!
    @IBOutlet weak var rightPlayerHeight: UILabel!
    @IBOutlet weak var leftPlayerWeight: UILabel!
    @IBOutlet weak var rightPlayerWeight: UILabel!
    @IBOutlet weak var leftWinLabel: UILabel!
    @IBOutlet weak var leftLossLabel: UILabel!
    @IBOutlet weak var leftKnockout: UILabel!
    @IBOutlet weak var rightWinLabel: UILabel!
    @IBOutlet weak var rightLossLabel: UILabel!
    @IBOutlet weak var rightKnockout: UILabel!
    var predictResponse = String()
    @IBAction func leftWin(sender: AnyObject) {
        
        let myUrl = NSURL(string: "http:boxing.farcon.in/predictmatch");
        
        let request = NSMutableURLRequest(URL:myUrl!);
        
        request.HTTPMethod = "POST";// Compose a query string
        
        var eventid = "2"
        var prediction = "leftwin"
        var id = clientid!
        
        let postString = "event_id=\(eventid)&client_id=\(id)&prediction=\(prediction)";
        
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
            
            print("responseStringstats = \(responseString!)")
            
            self.predictResponse =   (responseString!) as String
           print(self.predictResponse)
            //Let's convert response sent from a server side script to a NSDictionary object:
            
          /*  do {
                let myJSON =  try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? String
                
                
                
            } catch {
                print(error)
            }*/
        }
        task.resume()
}
  
    @IBAction func draw(sender: AnyObject) {
        let myUrl = NSURL(string: "http:boxing.farcon.in/predictmatch");
        
        let request = NSMutableURLRequest(URL:myUrl!);
        
        request.HTTPMethod = "POST";// Compose a query string
        
        var eventid = "2"
        var prediction = "draw"
        var id = clientid!
        
        let postString = "event_id=\(eventid)&client_id=\(id)&prediction=\(prediction)";
        
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
            
            print("responseStringstats = \(responseString!)")
            
            self.predictResponse =   (responseString!) as String
            print(self.predictResponse)
            //Let's convert response sent from a server side script to a NSDictionary object:
            
            /*  do {
             let myJSON =  try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? String
             
             
             
             } catch {
             print(error)
             }*/
        }
        task.resume()
    }
    @IBAction func rightWin(sender: AnyObject) {
        
        let myUrl = NSURL(string: "http:boxing.farcon.in/predictmatch");
        
        let request = NSMutableURLRequest(URL:myUrl!);
        
        request.HTTPMethod = "POST";// Compose a query string
        
        var eventid = "2"
        var prediction = "rightwin"
        var id = clientid!
        
        let postString = "event_id=\(eventid)&client_id=\(id)&prediction=\(prediction)";
        
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
            
            print("responseStringstats = \(responseString!)")
            
            self.predictResponse =   (responseString!) as String
            print(self.predictResponse)
            //Let's convert response sent from a server side script to a NSDictionary object:
            
            /*  do {
             let myJSON =  try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? String
             
             
             
             } catch {
             print(error)
             }*/
        }
        task.resume()
    }

    var leftId: String = ""
    var rightId: String = ""

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        let myUrl = NSURL(string: "http:boxing.farcon.in/eventplayer");
        
        let request = NSMutableURLRequest(URL:myUrl!);
        
        request.HTTPMethod = "POST";// Compose a query string
        
        var eventid = "2"
        
        let postString = "event_id=\(eventid)";
        
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
            
            //print("responseStringlogin = \(responseString!)")
            
            
            //Let's convert response sent from a server side script to a NSDictionary object:
            
            do {
                let myJSON =  try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSArray
                
              
                if let item = myJSON?[0] as? [String: AnyObject] {
                 
                    dispatch_async(dispatch_get_main_queue(), {
                        
                     self.leftPlayerName.text = item["name"]! as? String
                   // print(item["name"]!)
                   var x = item["id"] as! NSNumber
                        self.leftId = "\(x)"
                    self.leftPlayerTotFight.text = item["total_fights"]! as? String
                    self.leftPlayerWeight.text = item["weight"]! as? String
                     self.leftPlayerHeight.text = item["height"]! as? String
                     self.leftPlayerAge.text = item["age"]! as? String
                         self.leftWinLabel.text = item["win"]! as? String
                         self.leftLossLabel.text = item["loss"]! as? String
                         self.leftKnockout.text = item["knockout"]! as? String
                    })
                }
                if let item = myJSON?[1] as? [String: AnyObject] {
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        
                        self.rightPlayerName.text = item["name"]! as? String
                       // print(item["name"]!)
                        var x = item["id"] as! NSNumber
                        self.rightId = "\(x)"
                        self.rightPlayerTotFight.text = item["total_fights"]! as? String
                        self.rightPlayerWeight.text = item["weight"]! as? String
                        self.rightPlayerHeight.text = item["height"]! as? String
                        self.rightPlayerAge.text = item["age"]! as? String
                        self.rightWinLabel.text = item["win"]! as? String
                        self.rightLossLabel.text = item["loss"]! as? String
                        self.rightKnockout.text = item["knockout"]! as? String
                    })
                }
                
                
                
                
            } catch {
                print(error)
            }
        }
        task.resume()

        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
