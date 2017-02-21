////
//  ViewController_2ViewController.swift
//  ChattingApplication
//
//  Created by Sierra 4 on 17/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit
import Kingfisher
import CoreData


class ChatController: UIViewController{
    
    
    
    @IBOutlet weak var NameLabelOtlt: UILabel!
    @IBOutlet weak var imageVOut: UIImageView!
    
    @IBOutlet weak var TableViewOutlet: UITableView!
   
    @IBOutlet weak var txtFildOutl: UITextView!
        
    
    var tasks: [ChatEntity] = []
    var passedData : [String: Any] = [:]
    var messageData : [String] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        NameLabelOtlt.text = passedData["name"] as! String?
        
    imageVOut.kf.setImage(with: URL(string: (passedData["Image"] as! String)))
   
    
    TableViewOutlet.estimatedRowHeight = 73.0
        TableViewOutlet.rowHeight = UITableViewAutomaticDimension
    
    
    
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        TableViewOutlet.reloadData()
    }
    
    
    // let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    @IBAction func BackBtnActn(_ sender: Any)
    {
        self.dismiss(animated: false, completion: nil)
    }
    
    
    
    
    
    @IBAction func DoneActn(_ sender: Any)
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext    // define context
        let task = ChatEntity(context: context) // Link Task & Context
        task.message1 = txtFildOutl.text
        task.message2 = txtFildOutl.text
        
        
        
        messageData.append(txtFildOutl.text!)
        print("this works,\(messageData)")
        
        messageData.append(txtFildOutl.text!)
        print("hello ")
        txtFildOutl.text = ""
        TableViewOutlet.reloadData()
        
        
        // Save the data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    
    
    
    
    
    /* override func didReceiveMemoryWarning() {
     super.didReceiveMemoryWarning()
     // Dispose of any resources that can be recreated.
     }*/
    
    
    
    
    
    func getData()
    {
        do{
            tasks = try context.fetch(ChatEntity.fetchRequest())
            
        }catch
        {
            print("erroe")
        }
    }
    
}


//tableView extension
extension ChatController: UITableViewDelegate,UITableViewDataSource
    
{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // chatTableViewOutlet.isHidden = true
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print("\(messageData.count)")
        return messageData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
        
   //     let task = tasks[indexPath.row]
        
        if(tableView == TableViewOutlet)
        {
            
            
            // let task = ChatEntity[indexPath.row]
            if ((indexPath.row % 2) == 1)
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as!  ReciverTableViewCell
                
                cell.reciverChatOutlt.text = messageData[indexPath.row]
                cell.reciverChatOutlt.layer.cornerRadius = 10 //textfield
                
                
//                if let myName = task.message2 {
//                    cell.reciverChatOutlt.text = myName
//                }
                
                return cell
            }
                
            else if ((indexPath.row % 2) == 0)
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! SenderTableViewCell
                
                print(messageData[indexPath.row])
                
                cell.SndrChatOutlt.text = messageData[indexPath.row]
                cell.SndrChatOutlt.layer.cornerRadius = 10
                
                
                
//                if let myName = task.message1 {
//                    cell.SndrChatOutlt.text = myName
//                }
                return cell
                
            }
        }
        
        return UITableViewCell()
    }
    
}

//action sheet extension
extension ChatController:UIActionSheetDelegate
{
    func optionBtnActn(_ sender: Any)
    {
        func showActionSheet(sender: AnyObject) {
            // 1
            let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
            
            // 2
            let deleteAction = UIAlertAction(title: "Delete", style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                // println("File Deleted")
            })
            let saveAction = UIAlertAction(title: "Save", style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                // println("File Saved")
            })
            
            //
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
                (alert: UIAlertAction!) -> Void in
                // println("Cancelled")
            })
            
            
            // 4
            optionMenu.addAction(deleteAction)
            optionMenu.addAction(saveAction)
            optionMenu.addAction(cancelAction)
            
            // 5
            self.present(optionMenu, animated: true, completion: nil)
        }
    }
    
}


