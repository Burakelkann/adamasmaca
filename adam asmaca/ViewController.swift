//
//  ViewController.swift
//  adam asmaca
//
//  Created by Yusuf Burak Elkan on 19.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displaywordlabel: UILabel!
    @IBOutlet weak var wrongletters: UILabel!
    @IBOutlet weak var guesstextfield: UITextField!
    @IBOutlet weak var gameresim: UIImageView!
    @IBOutlet weak var adamresim: UIImageView!
    
    var wordarray = ["BURAK","HALİL","FURKAN"]
    var word = ""
    var wronglettersarray = [Character]()
    var usedletters = [Character]()
    var dislapwordarray = [Character]()
    var displayword = ""
    var guess:Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        word = wordarray.randomElement()!
        usedletters = Array(word)
        
        for _ in 1...word.count{
            displayword += "?"
            displaywordlabel.text = displayword
            dislapwordarray = Array(displayword)
        }
    }

    @IBAction func button(_ sender: Any) {
        guesstextfield.resignFirstResponder()
        
        let guess1 = guesstextfield.text
        
        if guess1 == "" {
            guesstextfield.placeholder = "Enter a letter"
            
        }else if guess1!.count > 1 {
            guesstextfield.placeholder = "Enter one letter"
            
        }else{
            guess = Character(guesstextfield.text!.capitalized)
            checkfor()
            displayword = String(dislapwordarray)
            displaywordlabel.text = displayword
            guesstextfield.text = ""
            checkforwin()
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        
        guesstextfield.text = ""
        adamresim.image = UIImage(contentsOfFile: "")
        gameresim.image = UIImage(contentsOfFile: "")
        wronglettersarray = []
        wrongletters.text = ""
        displayword = ""
        word = wordarray.randomElement()!
        usedletters = Array(word)
        
        for i in 1...word.count{
            displayword += "?"
            displaywordlabel.text = displayword
            dislapwordarray = Array(displayword)
    }
        }
    func checkfor() {
        if usedletters.contains(guess){
            
            for i in 0...word.count - 1 {
                if guess == usedletters[i] {
                    dislapwordarray[i] = guess
                }
            }
        }else{
            wronglettersarray.append(guess)
            wrongletters.text = String(wronglettersarray)
            placeImage()
            }
        }
    func placeImage(){
        let p1 = UIImage(named: "pic1")
        let p2 = UIImage(named: "pic2")
        let p3 = UIImage(named: "pic3")
        let p4 = UIImage(named: "pic4")
        let p5 = UIImage(named: "pic5")
        let p6 = UIImage(named: "pic6")
        let p7 = UIImage(named: "pic7")
        let p8 = UIImage(named: "pic8")
        let ımagearray = [p1,p2,p3,p4,p5,p6,p7,p8]
        adamresim.image = ımagearray[wronglettersarray.count-1]
    }
    func checkforwin(){
        if wronglettersarray.count == 8 {
            
            gameresim.image = UIImage(named: "gameover")
            
        }else if displayword.contains("?"){
            }else{
                gameresim.image = UIImage(named: "youvin")
            }
        }
    }
