class Magic8BallViewController < UIViewController
  def loadView
    self.view = UIImageView.alloc.init
  end

  def viewDidLoad
    view.image = UIImage.imageNamed('8ball.jpg')
    @label     = makeLabel
    view.addSubview(@label)

    view.userInteractionEnabled=true
    recognizer                 = UITapGestureRecognizer.alloc.initWithTarget(self, action: 'showAnswer')
    view.addGestureRecognizer(recognizer)

    @magic8Ball = Magic8Ball.new
  end

  def makeLabel
    label               = UILabel.alloc.initWithFrame([[10, 60], [300, 80]])
    label.text          = 'Tap for answer'
    label.textColor     = UIColor.darkGrayColor
    label.font          = UIFont.boldSystemFontOfSize(34)
    label.textAlignment = UITextAlignmentCenter
    label
  end

  def showAnswer
    @label.text = @magic8Ball.randomAnswer
  end
end