//
//  ViewController.swift
//  ChattingApplication
//
//  Created by Sierra 4 on 17/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//
import Kingfisher
import UIKit
import ContactsUI

class ViewController: UIViewController,CNContactPickerDelegate
{
    
    
    @IBOutlet weak var TableViewOutlt: UITableView!
    
    var selectedLowerMenu : Int = 0
    let pictures: [String] = ["settingsIcon","settingsIcon","settingsIcon","settingsIcon","phone"]
    //var contacts : [String] = ["vani","varun","sankalp","shalvi","abdul"]
    var header : [String] = ["Broadcast Lists                      New Group"]
    var varUsrData:[String:Any?]?
    var sectedIndex:Int = -1
    
    var contactsDetails = [Details(name:"vani mehak",
                                   chatD:"hi how are you?  where are you?",
                                   Image:URL(string:"http://www.gulte.com/content/2016/10/news/1477004619-146.jpg"),time:"6:00 AM"),
                           Details(name:" varun sharma",
                                   chatD: "<3 Cheese . Mayo . Garlic",
                                   Image:URL(string:"https://1.bp.blogspot.com/-gI3iXeJeMgk/V2x7RfNc1cI/AAAAAAAAATQ/qDS9Ml5o-_sljum6bCFL2Jz0xqlceWRnwCLcB/s1600/funny-frofile-pictures-and-dp-2-300x300.jpg"),time:"6:00 AM"),
                           Details(name:"sankalp vats",
                                   chatD:"CheGarlic",
                                   Image:URL(string:"http://www.funn4u.com/wp-content/uploads/2016/08/facebook-girls-new-dp-20.png"),time:"6:40 AM"),
                           Details(name:"MusAlfredo :)",
                                   chatD:"shalvi",
                                   Image:URL(string:"http://coolstatus.co/wp-content/uploads/2014/09/Cool-Dp.jpg"),time:"8:00 AM"),
                           Details(name:"Musdo",
                                   chatD:"shalvi jai",
                                   Image:URL(string:"http://s3.favim.com/orig/150211/couple-cute-dp-funny-face-Favim.com-2469222.jpg"),time:"7:00 PM"),
                           Details(name:" Alfredo",
                                   chatD:" Alfredo",
                                   Image:URL(string:"http://www.trickscity.com/wp-content/uploads/2016/07/Facebook-dp-and-covers-girls-boys-punjabi-girls-sexy-smoking-covers-sad-dp-263.jpg"),time:"6:00 AM"),
                           Details(name:"Mushroom...Cajun . Alfredo",
                                   chatD:"vabhav kumar ",
                                   Image:URL(string:"https://www.statuswhatsapp.co.in/wp-content/uploads/2016/02/BuguJRd.jpg"),time:"7:10 AM")
    ]
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        let contacts: [CNContact] = {
            let contactStore = CNContactStore()
            let keysToFetch = [
                CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                CNContactEmailAddressesKey,
                CNContactPhoneNumbersKey,
                CNContactImageDataAvailableKey,
                CNContactThumbnailImageDataKey] as [Any]
            
            // Get all the containers
            var allContainers: [CNContainer] = []
            do {
                allContainers = try contactStore.containers(matching: nil)
            } catch {
                print("Error fetching containers")
            }
            
            var results: [CNContact] = []
            
            // Iterate all containers and append their contacts to our results array
            for container in allContainers {
                let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
                
                do {
                    let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                    results.append(contentsOf: containerResults)
                } catch {
                    print("Error fetching results for container")
                }
            }
            
            return results
        }()
        
        var contact: [contactsDetails] = []
        contacts.enumerated().forEach{ index,cont in
            contact.append((contactsDetails), name:"",
                           chatD:"",
                           Image:URL(string:"") )
        }
        //print("Name",cont.givenName)
        
        contactsDetails.append(contact)
    }
    

    
    
        
        
        
    
    }
        // CoreDataManager.storeObj()
        //   CoreDataManager.fetchObj()
    
    
//    let ContactVar: [Details] = []
//    contacts.enumerated().forEach{ index,contact in
//            arraycontact.append(details(name:contact.givenName , chatD:"" , Image:URL(string:"\(arrayUrl[index])") ))
//    }
//     contactsDetails.append(ContactVar)

    



    



//MARK: - TableView Datasources/Delegates
extension ViewController : UITableViewDataSource  , UITableViewDelegate
{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return contactsDetails.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell" , for: indexPath) as? TableViewCell11            else
        {
            fatalError()
        }
        
       cell.Data = contactsDetails[indexPath.row]
        
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return header[section]
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        
        let tempUserData = contactsDetails[indexPath.row]
        varUsrData = ["name":tempUserData.name,"Image":tempUserData.Image]
        sectedIndex = indexPath.row
        guard let DestViewController : ChatController = self.storyboard?.instantiateViewController(withIdentifier: "ChatController") as? ChatController else { return }
        
        DestViewController.passedData = varUsrData!
        self.present(DestViewController, animated: true, completion: nil)
//        self.performSegue(withIdentifier: "Segue", sender: varUsrData)
        tableView.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 20.0
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.lightGray
        header.textLabel?.font =  UIFont(name: "Futura", size: 13)!
    }
    
    
    override func prepare( for segue : UIStoryboardSegue, sender: Any?)
   {
    
    
    }
    
}

