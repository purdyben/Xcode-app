//
//  ViewControllePor.swift
//  testApp
//
//  Created by Ben Purdy on 5/24/19.
//  Copyright ©19 Ben Purdy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var TeamObject:teamObject!
    @IBOutlet weak var player1Field: UITextField!
    @IBOutlet weak var player2Field: UITextField!
    @IBOutlet weak var player3Field: UITextField!
    @IBOutlet weak var player4Field: UITextField!
    @IBOutlet weak var player5Field: UITextField!
    @IBOutlet weak var TeamNameField: UITextField!
    @IBOutlet weak var testlable: UILabel!
   
    @IBOutlet var nextslide: UIView!
    
 
    @IBAction func startButton(_ sender: Any) {
        TeamObject = teamObject(name: TeamNameField.text!)
        let TextFieldArray = [player1Field,player2Field,player3Field,player4Field,player5Field]
//        for i in 1...5 {
//            if(TextFieldArray[i]?.text! != nil){
//            let player = PlayerObject(name: (TextFieldArray[i]?.text!)!)
//            TeamObject.add(addedPlayer: player)
//            }
//            TeamObject.addByName(player: "null")
//        }
        for i in 0...4 {
            let player = PlayerObject(name: (TextFieldArray[i]?.text!)!)
            TeamObject.add(addedPlayer: player)
            print(player.getName())
           
        }
        TeamObject.PrintTeamNames()
        
       
    }
    
    
    @IBOutlet weak var BottomImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        ConfigureTapGesture()
        configureTextFields()
        ConfigureSwipeGesture()
       
    }
    private func configureTextFields(){
        print("1")
       player1Field?.delegate = self
       player2Field?.delegate = self
       player3Field?.delegate = self
       player4Field?.delegate = self
       player5Field?.delegate = self
       TeamNameField?.delegate = self
        print("2")
    }
    private func ConfigureTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    private func ConfigureSwipeGesture(){
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeActions(Swipe:)))
        rightSwipe.direction = .right
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeActions(Swipe:)))
        leftSwipe.direction = .left
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeActions(Swipe:)))
        upSwipe.direction = .up
        
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(upSwipe)
    }
    @objc func handleTap(){
        print("Handled Tap")
        view.endEditing(true)
    }
    @IBAction func settingUp(_ sender: Any){
          view.endEditing(true)
    }
    @objc func swipeActions(Swipe:UISwipeGestureRecognizer){
        if(Swipe.state == .ended){
            switch Swipe.direction {
            case .right:
                performSegue(withIdentifier:  "goRight", sender: self)
                print("right")
            case .left:
                performSegue(withIdentifier:  "goLeft", sender: self)
                print("left")
            default:
                break
            }
        }
    }
    func SwitchingImages(Direction: String){
        if(Direction == "Right"){
            BottomImage.image = UIImage(named: "PointingRight")
        }else if(Direction == "Left"){
            BottomImage.image = UIImage(named: "PointingLeft")
        }else if ( Direction == "Top"){
            BottomImage.image = UIImage(named: "StartingImage")
            
        }
        
        
    }

}
extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField:UITextField) -> Bool{
        textField.resignFirstResponder()
        print("true")
        return true
    }
}

