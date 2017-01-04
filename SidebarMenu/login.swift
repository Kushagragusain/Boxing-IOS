//
//  login.swift
//  SidebarMenu
//
//  Created by Kushagra Gusain on 04/08/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import Foundation
import UIKit
var accessToken :String?
var clientid :String?
class login: UIViewController , UITextFieldDelegate{
    
    
    var errorString = String()
   
  
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var secretText: UITextField!
  
    @IBAction func signupButton(sender: UIButton) {
    }
    
    @IBAction func forgotPassword(sender: AnyObject) {
    }
   
    @IBAction func loginButton(sender: AnyObject) {
    
   
        let myUrl = NSURL(string: "http:boxing.farcon.in/oauth/access_token");
        
        let request = NSMutableURLRequest(URL:myUrl!);
        
        request.HTTPMethod = "POST";// Compose a query string
        
        var idSend = self.nameText.text
        var secretSend = self.secretText.text
        var gtype = "client_credentials"
 
        clientid = idSend
        let postString = "grant_type=\(gtype)&client_id=\(idSend!)&client_secret=\(secretSend!)" ;
        
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
            
            print("responseStringlogin = \(responseString!)")

            
            //Let's convert response sent from a server side script to a NSDictionary object:
            
             do {
             let myJSON =  try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
             
             
             
             // Now we can access value of First Name by its key
                if let responseFromApi = myJSON!["access_token"] as? NSMutableString{
            print("access_token: \(responseFromApi)")
                accessToken = (responseFromApi) as String
                }
                
                    if let responseError = myJSON!["error"]as? String{
               print("error:\(responseError)")
                self.errorString = (responseError)
            
                }
                
                
             
             } catch {
             print(error)
             }
        }
        task.resume()

        
    }
    

   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.nameText.delegate = self
        self.secretText.delegate = self
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
        if identifier == "toHome" {
            
            var name = self.nameText.text
            var secret = self.secretText.text
         
            clientid = name
            if accessToken == ""{
                var alert = UIAlertView(title: "Invalid", message: "Username or password dosen't match or invalid acount", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                
            return false
            
            }
            else if name!.characters.count < 4 {
                var alert = UIAlertView(title: "Invalid", message: "Username must be greater than 4 characters", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                return false
                
            }
            else if !(name >= "a" && name <= "z") && !(name >= "A" && name <= "Z"){
                var alert = UIAlertView(title: "Invalid", message: "Username must contain one alphabet", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                return false
            }
            else if secret!.characters.count < 8 {
                var alert = UIAlertView(title: "Invalid", message: "Password must be greater than 8 characters", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                return false
            }

            else {
                return true
            }
        }
        else if identifier == "toSignup"{
        return true
        }
        
        return true
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }



}