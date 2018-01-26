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


    
    @IBAction func tap1view(_ sender: Any) {

        
       let segue: UIStoryboardSegue
            // segueから遷移先のResultViewControllerを取得する
            let BigViewController:BigViewController = segue.destination as! BigViewController
            // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
            BigViewController.fileName1 = fileName

        
        
        
        
       //だ let storyboard: UIStoryboard = self.storyboard!
        
        //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
        let second = storyboard.instantiateViewController(withIdentifier: "target")
       //ここが実際に移動するコードとなります
   //     second.viecontrole
        self.present(second, animated: true, completion: nil)
  //      BigViewController.fileName = fileName
        
        // 背景色が青の場合は緑に、緑の場合は青に変更する
        if self.view.backgroundColor == UIColor.blue {
            self.view.backgroundColor = UIColor.green
        }else {
            self.view.backgroundColor = UIColor.blue
        }
 }
    
    var playF:Bool=false//初期停止
//    func setButtonsState1(_ next:Bool,_ last:Bool,_ play:String){
//        playButton.setTitle(play, for: UIControlState.normal)
//    }
    
    func setButtonsState(_ next:Bool,_ last:Bool,_ play:Bool)//,_ playB: String)
    {
        nextB.isEnabled = next
        lastB.isEnabled = last
        if play{
            playButton.setTitle("停止", for: UIControlState.normal)
        }else{
            playButton.setTitle("再生", for: UIControlState.normal)
        }
        
 //       setButtonsState1(true,false,"kkk")
    }
/*    func initImageView1(){
        // Screen Size の取得
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        // UIImage インスタンスの生成
        let image = UIImage(named:"img")!
        
        // 画像の幅・高さの取得
        width = image.size.width
        height = image.size.height
        
        // UIImageView インスタンス生成
        imageView = UIImageView(image:image)
        
        // 画像サイズをスクリーン幅に合わせる
        scale = screenWidth / width
        let rect:CGRect = CGRect(x:0, y:0, width:width*scale, height:height*scale)
        
        // ImageView frame をCGRectで作った矩形に合わせる
        imageView.frame = rect;
        
        // 画像の中心をスクリーンの中心位置に設定
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        // view に ImageView を追加する
        self.view.addSubview(imageView)
    }*/
    func initImageView(){
        // UIImage インスタンスの生成
        // 画像はAssetsに入れてないのとjpgなので拡張子を入れます
        let image1:UIImage = UIImage(named:"IMG_1448.jpg")!
        
        // UIImageView 初期化
        let imageView = UIImageView(image:image1)
 //       var width = image1.size.width
 //       var height = image1.size.height

        // 画面の横幅を取得
        let screenWidth:CGFloat = view.frame.size.width
        let screenHeight:CGFloat = view.frame.size.height
        
        // 画像の中心を画面の中心に設定
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        // UIImageViewのインスタンスをビューに追加
        self.view.addSubview(imageView)
        
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
    var imageView:UIImageView!
    var scale:CGFloat = 1.0
    var width:CGFloat = 0
    var height:CGFloat = 0
    var screenWidth:CGFloat = 0
    var screenHeight:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
   //     let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(
   //         target: self,
   //         action: #selector(ViewController.tapped(_:)))
        
        // デリゲートをセット
   //     tapGesture.delegate = self
        
   //     self.view.addGestureRecognizer(tapGesture)

 /*       // タップを定義
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.viewTap(_:)))
        
        // viewにタップを登録
        self.view.addGestureRecognizer(tap)

        // 背景色を変更
        self.view.backgroundColor = UIColor.blue
 */
        // Screen Size の取得
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        // UIImage インスタンスの生成
        fileName = "IMG_1448.jpg"
        let image = UIImage(named:fileName)!
        
        // 画像の幅・高さの取得
        width = image.size.width
        height = image.size.height
        
        // UIImageView インスタンス生成
        imageView = UIImageView(image:image)
        
        // 画像サイズをスクリーン幅に合わせる
        scale = screenWidth / width
//        let rect:CGRect = CGRect(x:0, y:0, width:width*scale, height:height*scale)
        let rect:CGRect = CGRect(x:width*scale/7, y:height*scale/7, width:5*width*scale/7, height:5*height*scale/7)

        // ImageView frame をCGRectで作った矩形に合わせる
        imageView.frame = rect;
        
        // 画像の中心をスクリーンの中心位置に設定
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        // view に ImageView を追加する
        self.view.addSubview(imageView)
        
        //       initImageView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
/*    override func viewDidLoad() {
        super.viewDidLoad()
        
        // タップを定義
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.viewTap(_:)))
        
        // viewにタップを登録
        self.view.addGestureRecognizer(tap)
        
        // 背景色を変更
        self.view.backgroundColor = UIColor.blueColor()
    }
  */
    
    /// viewをタップされた時の処理
    func viewTap(sender: UITapGestureRecognizer){
        print("タップされました")
        // 背景色が青の場合は緑に、緑の場合は青に変更する
        if self.view.backgroundColor == UIColor.blue {
            self.view.backgroundColor = UIColor.green
        }else {
            self.view.backgroundColor = UIColor.blue
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let bBigViewController:BigViewController = segue.destination as! BigViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        bBigViewController.fileName1 = fileName
            //.fx = 1
     //   resultViewController.y = 1
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }

}

