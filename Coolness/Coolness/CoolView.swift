import UIKit

class CoolView: UIView
{
    var textField: UITextField!
    var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.brown
        configureSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addCoolCell(button: UIButton) {
        print("In \(#function), text is \(textField.text ?? "nil")")
        let newCoolCell = CoolCell(frame: CGRect.zero)
        newCoolCell.text = textField.text
        newCoolCell.sizeToFit()
        contentView.addSubview(newCoolCell)
    }
    
    // TODO: Call this from somewhere
    //
    func configureSubviews() {
        let (accessoryRect, contentRect) = bounds.divided(atDistance: 80, from: .minYEdge)
        let accessoryView = UIView(frame: accessoryRect)
        let contentView = UIView(frame: contentRect)
        
        self.contentView = contentView
        contentView.clipsToBounds = true
        
        addSubview(accessoryView)
        addSubview(contentView)
        
        // Controls
        
        let textField = UITextField(frame: CGRect(x: 8, y: 42, width: 240, height: 30))
        self.textField = textField
        accessoryView.addSubview(textField)
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter some text"
        
        textField.delegate = self
        
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.sizeToFit()
        button.frame = button.frame.offsetBy(dx: 260, dy: 42)
        
        button.addTarget(self, action: #selector(addCoolCell(button:)), for: .touchUpInside)
        
        button.addTarget(nil, action: #selector(cut(_:)), for: .touchUpOutside)
        
        accessoryView.addSubview(button)
        
        
        // Cells
        
        let subview1 = CoolCell(frame: CGRect(x: 20, y: 30, width: 100, height: 40))
        let subview2 = CoolCell(frame: CGRect(x: 50, y: 90, width: 100, height: 40))
        contentView.addSubview(subview1)
        contentView.addSubview(subview2)
        
        subview1.text = "Have a nice day! 😊"
        subview2.text = "CoolCells are cool! 🕶"
        
        accessoryView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        contentView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        subview1.backgroundColor = UIColor.purple
        subview2.backgroundColor = UIColor.orange
    }
}

extension CoolView: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

