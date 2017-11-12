//
//  ViewController.swift
//  4
//
//  Created by 候钊轶 on 2017/8/1.
//  Copyright © 2017年 Joey. All rights reserved.
//

import UIKit

class MentorsController: UITableViewController {
    
    @IBOutlet weak var MyTabView: UITableView!
    
    //@IBOutlet var swipe: UISwipeGestureRecognizer!
    
    var mentors = [Mentor]()
    var newMentors = [Mentor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let brian = Mentor(name: "Brian", location: "Shanghai", images: "brian")
        let karen = Mentor(name: "Karen", location: "Shenzhen", images: "karen")
        let derek = Mentor(name: "Derek", location: "Outer Space", images: "derek")
        let henry = Mentor(name: "Henry", location: "Shenzhen", images: "henry")
        
        //print(brian.name)
        mentors.append(brian)
        mentors.append(karen)
        mentors.append(derek)
        mentors.append(henry)
        print(mentors[0])
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let grayView = UIView()
        //redView.text.color = .white
        grayView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        let textOfHeader = UILabel()
        if section == 0{
            textOfHeader.frame = CGRect(x: 0, y: 0, width: 200, height: 20)
            textOfHeader.text = " Initial Mentor"
            textOfHeader.font = UIFont.boldSystemFont(ofSize: 16)
            textOfHeader.textColor = .black}
        else if section == 1 {
            textOfHeader.frame = CGRect(x: 0, y: 0, width: 200, height: 20)
            textOfHeader.text = " New Mentor"
            textOfHeader.font = UIFont.boldSystemFont(ofSize: 16)
            textOfHeader.textColor = .black}
        
        grayView.addSubview(textOfHeader)
        return grayView
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func doSomeStuff(){
        print("Do some stuff!")
    }
    
    func didFinishAddingMentor(mentor: Mentor){
        print(mentor.name)
        newMentors.append(mentor)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Prepare for segue")
        let AddMentorControllerViewController = segue.destination as? AddMentorControllerViewController
        AddMentorControllerViewController?.mentorController = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return mentors.count}
        else {return newMentors.count}
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! CustomMentorsCell
        if indexPath.section == 0{
            let mentor = mentors[indexPath.row]
            cell.nameLabel.text = mentor.name
            cell.yearLabel.text = mentor.location
            let image = UIImage(named: mentor.images)
            cell.images.image = image
            cell.images.backgroundColor = .red}
        else {let mentor1 = newMentors[indexPath.row]
            cell.nameLabel.text = mentor1.name
            cell.yearLabel.text = mentor1.location
            let image = UIImage(named: mentor1.images)
            cell.images.image = image
            cell.images.backgroundColor = .red}
        print(cell.textLabel?.text)
        return cell
        
    }
    
    
    
    //@IBOutlet var swipe: UISwipeGestureRecognizer!
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0{
        mentors.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        } else {newMentors.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
        
}
