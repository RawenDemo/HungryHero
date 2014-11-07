package screens
{
	import events.NavigationEvent;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class About extends Sprite
	{
		private var bg:Image;
		private var title:Image;
		private var starlingLogo:Button;
		private var hsharmaLogo:Button;
		private var backBtn:Button;
		private var aboutText:Image;
		
		public function About()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			trace("about screen initialized");
			
			drawScreen();
		}
		private function drawScreen():void
		{
			bg = new Image(Assets.getTexture("BgWelcome"));
			this.addChild(bg);
			
			title = new Image(Assets.getAtlas().getTexture("welcome_title"));
			title.x = 440;
			title.y = 20;
			this.addChild(title);
			
			backBtn = new Button(Assets.getAtlas().getTexture("about_backButton"));
			backBtn.x = 500;
			backBtn.y = 300;
			this.addChild(backBtn);
			
			hsharmaLogo = new Button(Assets.getAtlas().getTexture("about_hsharmaLogo"));
			hsharmaLogo.x = 10;
			hsharmaLogo.y = 480;
			this.addChild(hsharmaLogo);
			
			starlingLogo = new Button(Assets.getAtlas().getTexture("about_starlingLogo"));
			starlingLogo.x = 230;
			starlingLogo.y = 480;
			this.addChild(starlingLogo);
			
			aboutText = new Image(Assets.getTexture("AboutText"));
			aboutText.x = 10;
			aboutText.y = 120;
			this.addChild(aboutText);
			
			this.addEventListener(Event.TRIGGERED, onBackButtonClick);
		}
		private function onBackButtonClick(event:Event):void
		{
			var buttonClicked:Button = event.target as Button;
			if((event.target as Button) == backBtn)
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "menu"}, true));
			}
		}
		public function disposeTemporarily():void
		{
			this.visible = false;
		}
		public function initialize():void
		{
			this.visible = true;
		}
	}
}