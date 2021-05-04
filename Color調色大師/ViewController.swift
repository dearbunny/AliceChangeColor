//
//  ViewController.swift
//  Color調色大師
//
//  Created by Rose on 2021/5/3.
//

import UIKit

class ViewController: UIViewController {
    
    //背影陰影
    @IBOutlet weak var aliceBackgroundImageView: UIImageView!
    
    // 調色Slider
    //@IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    // 邊框圓角陰影Slider
    @IBOutlet weak var radiusSlider: UISlider!
    @IBOutlet weak var borderSlider: UISlider!
    @IBOutlet weak var shadowSlider: UISlider!
    @IBOutlet weak var shadowView: UIView!
    
    // 局部調整 選擇變色物件的SegmentedControl
    @IBOutlet weak var changeElementSegmentedControl: UISegmentedControl!
    
    // 局部調整 顯示顏色對應數值的Label
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var alphaValueLabel: UILabel!
    
    // 用變數來儲存 帽子、背景、邊框三種物件的各項調整值（此為初始值，使用者調整過Slider後則會存入新的值）
//    var hatRedValue: Float = 47/255
//    var hatGreenValue: Float = 44/255
//    var hatBlueValue:Float = 63/255
//    var hatAlphaValue: Float = 1
    var bgRedValue: Float = 247/255
    var bgGreenValue: Float = 253/255
    var bgBlueValue: Float = 119/255
    var bgAlphaValue: Float = 1
    var borderRedValue: Float = 0
    var borderGreenValue: Float = 0
    var borderBlueValue: Float = 0
    var borderAlphaValue: Float = 1
    
    // 花色狀態儲存（判斷是否開啟花色）
//    var patternSwitchBool = false
//    var lepordPatternBool = false
//    var giraffePatternBool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 自訂Slider圖案
        redSlider.setThumbImage(UIImage(named: "btn-2"), for: .normal)
        greenSlider.setThumbImage(UIImage(named: "btn-1"), for: .normal)
        blueSlider.setThumbImage(UIImage(named: "btn-3"), for: .normal)
        alphaSlider.setThumbImage(UIImage(named: "btn-4"), for: .normal)
        radiusSlider.setThumbImage(UIImage(named: "btn-5"), for: .normal)
        borderSlider.setThumbImage(UIImage(named: "btn-6"), for: .normal)
        shadowSlider.setThumbImage(UIImage(named: "btn-7"), for: .normal)
    }
    
    // 自定function區
    // 顯示顏色對應數值於Label上，原本value只有 0-1，乘以255讓數值較直觀（一般使用者選色是用 R: 30/255 不會記 0.12）
    func colorValueLabelShow(){
        redValueLabel.text = String(format: "%.0f", redSlider.value * 255)
        greenValueLabel.text = String(format: "%.0f", greenSlider.value * 255)
        blueValueLabel.text = String(format: "%.0f", blueSlider.value * 255)
        alphaValueLabel.text = String(format: "%.1f", alphaSlider.value)
    }
    
    // 每次變動顏色後將對應的value儲存至原本變數中（帽子、背景、邊框各一）
//    func hatColorValueSave(){
//        hatRedValue = redSlider.value
//        hatGreenValue = greenSlider.value
//        hatBlueValue = blueSlider.value
//        hatAlphaValue = alphaSlider.value
//    }
    func bgColorValueSave(){
        bgRedValue = redSlider.value
        bgGreenValue = greenSlider.value
        bgBlueValue = blueSlider.value
        bgAlphaValue = alphaSlider.value
    }
    func borderColorValueSave(){
        borderRedValue = redSlider.value
        borderGreenValue = greenSlider.value
        borderBlueValue = blueSlider.value
        borderAlphaValue = alphaSlider.value
    }
    
    // 用已儲存進變數的Value（新的顏色數值）讓Slider跳至相對應的位置
//    func hatColorSliderSet(){
//        redSlider.setValue(hatRedValue, animated: true)
//        greenSlider.setValue(hatGreenValue, animated: true)
//        blueSlider.setValue(hatBlueValue, animated: true)
//        alphaSlider.setValue(hatAlphaValue, animated: true)
//    }
    func bgColorSliderSet(){
        redSlider.setValue(bgRedValue, animated: true)
        greenSlider.setValue(bgGreenValue, animated: true)
        blueSlider.setValue(bgBlueValue, animated: true)
        alphaSlider.setValue(bgAlphaValue, animated: true)
    }
    func borderColorSliderSet(){
        redSlider.setValue(borderRedValue, animated: true)
        greenSlider.setValue(borderGreenValue, animated: true)
        blueSlider.setValue(borderBlueValue, animated: true)
        alphaSlider.setValue(borderAlphaValue, animated: true)
    }
    

    // 調顏色區（注意：每調整一次Slider就要儲存新的值進變數中）並用if else判斷要調哪個物件的顏色
    // Slider更動
    @IBAction func changeColor(_ sender: Any) {
        if changeElementSegmentedControl.selectedSegmentIndex == 0{
            aliceBackgroundImageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            bgColorValueSave()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 1{
            aliceBackgroundImageView.layer.borderColor = CGColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            borderColorValueSave()
        }
        colorValueLabelShow()
    }
    
    // 全部隨機按鈕
    @IBAction func elementAllRandomButtonClicked(_ sender: Any) {
        redSlider.value = Float.random(in: 0...1)
        greenSlider.value = Float.random(in: 0...1)
        blueSlider.value = Float.random(in: 0...1)
        alphaSlider.value = Float.random(in: 0.1...1)
        if changeElementSegmentedControl.selectedSegmentIndex == 0{
            aliceBackgroundImageView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0.1...1))
            bgColorValueSave()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 1{
            aliceBackgroundImageView.layer.borderColor = CGColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0.1...1))
            borderColorValueSave()
        }
        colorValueLabelShow()
    }
    
    // 各選項隨機按鈕（紅、綠、藍、透明度各一）
    @IBAction func redRandomButtonClicked(_ sender: Any) {
        redSlider.value = Float.random(in: 0...1)
        redValueLabel.text = String(format: "%.0f", redSlider.value * 255)
        if changeElementSegmentedControl.selectedSegmentIndex == 0{
            aliceBackgroundImageView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            bgColorValueSave()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 1{
            aliceBackgroundImageView.layer.borderColor = CGColor(red: CGFloat.random(in: 0...1), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            borderColorValueSave()
        }
    }
    
    @IBAction func greenRandomButtonClicked(_ sender: Any) {
        greenSlider.value = Float.random(in: 0...1)
        greenValueLabel.text = String(format: "%.0f", greenSlider.value * 255)
        if changeElementSegmentedControl.selectedSegmentIndex == 0{
            aliceBackgroundImageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat.random(in: 0...1), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            bgColorValueSave()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 1{
            aliceBackgroundImageView.layer.borderColor = CGColor(red: CGFloat(redSlider.value), green: CGFloat.random(in: 0...1), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            borderColorValueSave()
        }
    }
    
    
    @IBAction func blueRandomButtonClicked(_ sender: Any) {
        blueSlider.value = Float.random(in: 0...1)
        blueValueLabel.text = String(format: "%.0f", blueSlider.value * 255)
        if changeElementSegmentedControl.selectedSegmentIndex == 0{
            aliceBackgroundImageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat.random(in: 0...1), alpha: CGFloat(alphaSlider.value))
            bgColorValueSave()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 1{
            aliceBackgroundImageView.layer.borderColor = CGColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat.random(in: 0...1), alpha: CGFloat(alphaSlider.value))
            borderColorValueSave()
        }
    }
    
    @IBAction func alphaRandomButtonClicked(_ sender: Any) {
        alphaSlider.value = Float.random(in: 0.1...1)
        alphaValueLabel.text = String(format: "%.1f", alphaSlider.value)
        if changeElementSegmentedControl.selectedSegmentIndex == 0{
            aliceBackgroundImageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat.random(in: 0.1...1))
            bgColorValueSave()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 1{
            aliceBackgroundImageView.layer.borderColor = CGColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat.random(in: 0.1...1))
            borderColorValueSave()
        }
    }
    
    // 重新調色按鈕（跳回該物件原本預設顏色）
    @IBAction func resetButtonClick(_ sender: UIButton) {
        if changeElementSegmentedControl.selectedSegmentIndex == 0{
            bgRedValue = 247/255
            bgGreenValue = 253/255
            bgBlueValue = 119/255
            bgAlphaValue = 1
            bgColorSliderSet()
            aliceBackgroundImageView.backgroundColor = UIColor(red: 247/255, green: 253/255, blue: 119/255, alpha: 1)
            bgColorValueSave()
            
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 1{
            borderRedValue = 0
            borderGreenValue = 0
            borderBlueValue = 0
            borderAlphaValue = 1
            borderColorSliderSet()
            aliceBackgroundImageView.layer.borderColor = UIColor.black.cgColor
            borderColorValueSave()
            
        }
        colorValueLabelShow()
    }
    
    
    // IBAction Start
    // 按Segment control欄位選物件 觸發的所有動作
    @IBAction func segmentControlChanged(_ sender: Any) {
        if changeElementSegmentedControl.selectedSegmentIndex == 0{
            aliceBackgroundImageView.backgroundColor = UIColor(red: CGFloat(bgRedValue), green: CGFloat(bgGreenValue), blue: CGFloat(bgBlueValue), alpha: CGFloat(bgAlphaValue))
            bgColorSliderSet()
            
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 1{
            aliceBackgroundImageView.layer.borderColor = CGColor(red: CGFloat(borderRedValue), green: CGFloat(borderGreenValue), blue: CGFloat(borderBlueValue), alpha: CGFloat(borderAlphaValue))
            borderColorSliderSet()
            
        }
        colorValueLabelShow()
    }
    
    
    
    
    // 圖片調整區
    // 選項開關On時顯示該選項的調節Slider
    @IBAction func pictureRadiusSwitchOn(_ sender: UISwitch) {
        if sender.isOn{
            radiusSlider.isHidden = false
            aliceBackgroundImageView.layer.cornerRadius = CGFloat(radiusSlider.value)
            shadowView.layer.cornerRadius = CGFloat(radiusSlider.value)
        }else{
            radiusSlider.isHidden = true
            aliceBackgroundImageView.layer.cornerRadius = 0
            
        }
    }
    //邊框
    @IBAction func pictureBoderSwitchOn(_ sender: UISwitch) {
        if sender.isOn{
            borderSlider.isHidden = false
            aliceBackgroundImageView.layer.borderColor = CGColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        }else{
            borderSlider.isHidden = true
            aliceBackgroundImageView.layer.borderColor = UIColor.clear.cgColor
        }
    }
    //陰影
    @IBAction func pictureShadowSwitchOn(_ sender: UISwitch) {
        if sender.isOn{
            shadowSlider.isHidden = false
            shadowView.layer.shadowOffset = CGSize(width: 5, height: 5)
            shadowView.layer.shadowColor = UIColor.darkGray.cgColor
            shadowView.layer.shadowOpacity = 0.5
        }else{
            shadowSlider.isHidden = true
            shadowView.layer.shadowOpacity = 0
        }
    }
    
    
    // 邊框圓角陰影變動
    @IBAction func radiusSliderChange(_ sender: Any) {
        aliceBackgroundImageView.layer.cornerRadius = CGFloat(radiusSlider.value)
        shadowView.layer.cornerRadius = CGFloat(radiusSlider.value)
    }
    @IBAction func borderSliderChange(_ sender: Any) {
        aliceBackgroundImageView.clipsToBounds = true
        aliceBackgroundImageView.layer.borderWidth = CGFloat(borderSlider.value)
    }
    @IBAction func shadowSliderChange(_ sender: Any) {
        shadowView.layer.shadowRadius = CGFloat(shadowSlider.value)
    }
    
    
    //亂數顏色
//    @IBAction func random(_ sender: Any) {
//        redSlider.value = Float.random(in: 0...1)
//        greenSlider.value = Float.random(in: 0...1)
//        blueSlider.value = Float.random(in: 0...1)
//        alphaSlider.value = Float.random(in: 0...1)
//
//        aliceBackgroundImageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
//    }
    

}

