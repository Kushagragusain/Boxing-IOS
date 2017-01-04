//
//  tbvLiveScoring.swift
//  Boxing
//
//  Created by Kushagra Gusain on 09/08/16.
//  Copyright © 2016 Kushagra. All rights reserved.
//

import Foundation
import UIKit
var submitOneScore = String()
var submitTwoScore = String()
var activekey : Int?
class tbvLiveScoring: UIViewController {
   
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var extraButton: UIBarButtonItem!
    @IBOutlet weak var playerOneName: UILabel!
    @IBOutlet weak var playerOneScore: UILabel!
    @IBOutlet weak var playerTwoName: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    
    @IBAction func playerTwoScoreDec(sender: AnyObject) {
        
        if checktime > 0{
        if someRight > 0{
            someRight -= 1
        }
        else{
            var alert = UIAlertView(title: "Invalid", message: "Minimum score can be 0", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        }
        else{
            var alert = UIAlertView(title: "Sorry!!", message: "Time is Up. Now wait for another round", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        
    }
    @IBAction func playerTwoScoreInc(sender: AnyObject) {
        if checktime > 0{
        if someRight < 10{
            someRight += 1
        }
        else{
            var alert = UIAlertView(title: "Invalid", message: "Maximum score can be 10", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        }
        else{
            var alert = UIAlertView(title: "Sorry!!", message: "Time is Up. Now wait for another round", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
    }


    @IBAction func playerOneScoreDec(sender: AnyObject) {
        if checktime > 0{
        if someValue > 0{
            someValue -= 1
        }
        else{
            var alert = UIAlertView(title: "Invalid", message: "Minimum score can be 0", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        }
        else{
            var alert = UIAlertView(title: "Sorry!!", message: "Time is Up. Now wait for another round", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
    }
  
    @IBAction func playerOneScoreInc(sender: AnyObject) {
        if checktime > 0{
        if someValue < 10{
            someValue += 1
        }
        else{
            var alert = UIAlertView(title: "Invalid", message: "Maximum score can be 10", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        }
        else{
            var alert = UIAlertView(title: "Sorry!!", message: "Time is Up. Now wait for another round", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
       
    }
    
    @IBAction func submitScore(sender: AnyObject) {
        
        submitOneScore = playerOneScore.text!
        submitTwoScore = playerTwoScore.text!
        checkActiveRound()
        let myUrl = NSURL(string: "http:boxing.farcon.in/predictround");
        
        let request = NSMutableURLRequest(URL:myUrl!);
        
        request.HTTPMethod = "POST";// Compose a query string
        
        var eventid = "1"
        var clietid = clientid!
        //print(clietid)
        var roundno = (activekey)!
        var roundnofinal = roundno + 1
        print(roundno)
        var name1 = "kushagra"
        var name2 = "prakhar"
        
        let postString = "event_id=\(eventid)&client_id=\(clietid)&round_no=\(roundnofinal)&prediction1=\(submitOneScore)&player1=\(name1)&prediction2=\(submitTwoScore)&player2=\(name2)";
        
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
            
           // print("responseStringslivescoring = \(responseString!)")
            
            self.submitresponsestring =  (responseString)!
            
            //Let's convert response sent from a server side script to a NSDictionary object:
            
            /*do {
                let myJSON =  try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSArray
             
                
            }
                
            catch {
                print(error)
            }*/
        }
        task.resume()
     
    }
    var someValue: Int = 0 {
        didSet {
            playerOneScore.text = "\(someValue)"
        }
    }
    var someRight: Int = 0 {
        didSet {
            playerTwoScore.text = "\(someRight)"
        }
    }
    var submitresponsestring = NSString()
    var activeflag = [String]()
    var eventid = [String]()
    var roundno = [String]()
    var id = [String]()
    var starttime = [String]()
    var counter = 120
    var timer = NSTimer()
    var checktime : Int = 0
    
    func timerAction() {
        counter = counter - 1
        if counter >= 0{
        timeLabel.text = "\(counter)"
            checktime = counter
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        someValue = 0
        someRight = 0
        
        
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        let myUrl = NSURL(string: "http:boxing.farcon.in/rounds");
        
        let request = NSMutableURLRequest(URL:myUrl!);
        
        request.HTTPMethod = "POST";// Compose a query string
        
        var eventid = "1"
        
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
            
           // print("responseStringslivescoring = \(responseString!)")
            
            //Let's convert response sent from a server side script to a NSDictionary object:
            
              do {
             let myJSON =  try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSArray
                for x in myJSON! {
                  
                    if let item = x as? [String: AnyObject] {
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        
                         self.activeflag.append((item["active_flag"] as? String)!)
                         self.roundno.append((item["round_no"] as? String)!)
                         self.eventid.append((item["event_id"] as? String)!)
                        var x = item["id"] as! NSNumber
                        self.id.append("\(x)")
                         self.starttime.append((item["start_time"] as? String)!)
                        
                    })
                    }
                }
        
              }
              
              catch {
             print(error)
             }
        }
        task.resume()

        
        if revealViewController() != nil {
            //            revealViewController().rearViewRevealWidth = 62
            menuButton.target = revealViewController()
            menuButton.action = "revealToggle:"
            
            revealViewController().rightViewRevealWidth = 150
            extraButton.target = revealViewController()
            extraButton.action = "rightRevealToggle:"
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func checkActiveRound() {
        
        for(var i = 0; i < activeflag.count ; i++ ){
            
            if activeflag[i] == "1" {
                var x = i as! Int
                activekey = (x)
                
            }
            
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
     
        if identifier == "toWinnerSelect"{
        
    
            if submitresponsestring == "truexxx"{
                var alert = UIAlertView(title: "Congrats!!", message: "You have made your prediction. This is your prediction table.", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                return true
            }
            else if submitresponsestring == "falsexxx"
            {
                var alert = UIAlertView(title: "Sorry!!", message: "Prediction already made or your time expired. This is your prediction table", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                return true
            }
         
           
        }
            return true
    }

}
