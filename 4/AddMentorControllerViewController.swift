//
//  AddMentorControllerViewController.swift
//  4
//
//  Created by 候钊轶 on 2017/8/2.
//  Copyright © 2017年 Joey. All rights reserved.
//

import UIKit

class AddMentorControllerViewController: UIViewController {

    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var YearTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add A Person"
        NameTextField.text = ""
        YearTextField.text = ""
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(handleDone))

        // Do any additional setup after loading the view.
    }

    var mentorController : MentorsController?
    
    func handleDone(){
        let addMentor = Mentor(name: NameTextField.text!, location: YearTextField.text!, images: "secretMan")
        mentorController?.didFinishAddingMentor(mentor: addMentor)
        navigationController?.popViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
