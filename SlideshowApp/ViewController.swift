//
//  ViewController.swift
//  SlideshowApp
//
//  Created by kuroda tatsuaki on 2018/01/21.
//  Copyright © 2018年 tatsuaki.kuroda. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {
//    class ViewController: UIViewController,UIGestureRecognizerDelegate  {
    var fileName:String = ""
    var fileNames = [String]()
    var fileNumber = 0
    var fileCnt = 0
    var playF:Bool=false//初期停止
    // タイマー用の時間のための変数
    var timer_sec: Float = 0

    @IBOutlet weak var smallView: UIImageView!
    func setFilenames(){
       //プロジェクトに追加されたファイルを自動的に登録したいが、解らない
    fileNames=["IMG_1448.jpg","IMG_1454.jpg","IMG_1469.jpg","IMG_2461.jpg"]
        fileCnt = fileNames.count
    }
    
    // selector: #selector(updatetimer) で指定された関数
    @objc func updateTimer(timer: Timer) {
        if playF {
            nextPhoto(0)
      }
    }
 
    @IBOutlet weak var nextB: UIButton!
    @IBOutlet weak var lastB: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBAction func playPhoto(_ sender: Any) {
        if playF {
            playF=false;
            nextB.isEnabled = true
            lastB.isEnabled = true
            playButton.setTitle("再生", for: UIControlState.normal)
            
        }else{
            playF=true;
            nextB.isEnabled = false
            lastB.isEnabled = false
            playButton.setTitle("停止", for: UIControlState.normal)
            
        }
    }
    
    @IBAction func lastPhoto(_ sender: Any) {
        fileNumber -= 1
        if fileNumber < 0 {
            fileNumber = fileCnt-1
        }
        smallView.image = #imageLiteral(resourceName: fileNames[fileNumber])
     }
    
    @IBAction func nextPhoto(_ sender: Any) {
        fileNumber += 1
        if fileNumber > fileCnt-1{
            fileNumber = 0
        }
        smallView.image = #imageLiteral(resourceName: fileNames[fileNumber])
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        setFilenames()
        smallView.image = #imageLiteral(resourceName: fileNames[fileNumber])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        if playF {
            playPhoto(0)
        }
        let bBigViewController:BigViewController = segue.destination as! BigViewController
        bBigViewController.fileName = fileNames[fileNumber]
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }

}

