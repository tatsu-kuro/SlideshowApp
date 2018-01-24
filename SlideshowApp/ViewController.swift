//
//  ViewController.swift
//  SlideshowApp
//
//  Created by kuroda tatsuaki on 2018/01/21.
//  Copyright © 2018年 tatsuaki.kuroda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var playF:Bool=false//初期停止
 //   func setButtonsState(_ next:Bool,_ last:Bool,_ play:String)
    func setButtonsState(_ next:Bool,_ last:Bool,_ play:Bool)//,_ playB: String)
    {
        nextB.isEnabled = next
        lastB.isEnabled = last
        if play{
            playButton.setTitle("停止", for: UIControlState.normal)
        }else{
            playButton.setTitle("再生", for: UIControlState.normal)
        }
    }

    @IBOutlet weak var nextB: UIButton!
    @IBOutlet weak var lastB: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBAction func playPhoto(_ sender: Any) {
        if playF {
            playF=false;
            setButtonsState(true,true,playF)
        }else{
            playF=true;
            setButtonsState(false,false,playF)
        }
    }
    @IBAction func lastPhoto(_ sender: Any) {
    

    }
    @IBAction func nextPhoto(_ sender: Any) {
       

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
//        let resultViewController:ResultViewController = //////segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
    //    resultViewController.x = 1
     //   resultViewController.y = 1
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }

}

