//
//  ViewController.swift
//  TIC TAC TOE
//
//  Created by Ekansh Anand Srivastava on 09/12/18.
//  Copyright © 2018 Avi Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        result.isHidden=true
        playagain.isHidden=true
        
        result.center = CGPoint(x: result.center.x-500, y: result.center.y)
    }
    
    
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func playagain(_ sender: Any) {
        activegame = true
        chance=1
        state = [0,0,0,0,0,0,0,0,0]
        for i in 1..<10{
            if let button1 = view.viewWithTag(i) as? UIButton{
                button1.setImage(nil, for: .normal)
            }
            result.isHidden=true
            playagain.isHidden=true
            
            result.center = CGPoint(x: result.center.x-500, y: result.center.y)
        }
    }
    
    @IBOutlet weak var playagain: UIButton!
    
    
    var activegame = true
    var chance = 1
    
    var state=[0,0,0,0,0,0,0,0,0] //0 - empty , 1 - circle , 2 - cross
    
    //1 is circle
    //2 is cross
    
    let wincombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    let image1 = UIImage(named: "lettero")
    let image2 = UIImage(named: "letterx")
    
   
    @IBAction func button1(_ sender: UIButton) {
        
        let activestate = sender.tag - 1
        
        if(state[activestate]==0 && activegame) {
            state[activestate]=chance
            
            if(chance==1){
                sender.setBackgroundImage(image1, for: .normal)
                chance=2
            }
            else{
                sender.setBackgroundImage(image2, for: .normal)
                chance=1
            }
            
        }
        
        for combinations in wincombinations {
            
            if state[combinations[0]] != 0 && state[combinations[0]]==state[combinations[1]] && state[combinations[1]]==state[combinations[2]] {
                
                //WINNER
                
                activegame=false
                
                if(state[combinations[0]]==1){
                    result.text = "CIRCLES HAVE WON"
                }
                else{
                    result.text = "CROSSES HAVE WON"
                }
                
                result.isHidden=false
                playagain.isHidden=false
                
                UIView.animate(withDuration: 1, animations:{ self.result.center=CGPoint(x: self.result.center.x+500, y: self.result.center.y)
                    
                    
                })
                
        }
    }
        
        
}
    
    
}
