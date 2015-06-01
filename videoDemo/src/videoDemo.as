package
{
	import com.delegate.BaseDelegate;
	import com.video.source.VSInfo;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.media.Video;
	import flash.text.TextField;
	
	public class videoDemo extends Sprite
	{
		private var _v:Video;
		private var _bd:BaseDelegate;
		private var _ctl:TextField;
		private var _ttl:TextField;
		
		public function videoDemo()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			init();
		}
		
		private function init():void {
			_v = new Video();
			_bd = new BaseDelegate();
//			var url:String = "rtmp://live.cdn3.v.17173.com/glive";
//			var nsUrl:String = "1862180_1430810471?k=074f7fb9e0047ff58349cb1c9719b6a2&t=55486fb2";
			var url:String = null;
			var nsUrl:String = "http://110.18.246.14/vod.cdn1.v.17173.com/2ad500633a70e0bb0048a012b5c55500c12089887700e555/cz8/FLVList/20150505/2/21603258_23864446_1.mp4?wsiphost=local";
			_bd.init(_v, url, nsUrl, function (type:String, value:String):void {backFun(type, value)});
		}
		
		private function backFun(type:String, value:String):void {
			trace(type);
			switch (type) {
				case VSInfo.LOG :
					break;
				case VSInfo.META_DATA :
					showVideo();
					showContorl();
					break;
			}
		}
		
		private function showContorl():void
		{
			showCurrentTime();
			showTotalTime();
		}
		
		private function showTotalTime():void
		{
			_ttl = new TextField();
			_ttl.x = 720;
			addChild(_ttl);
			_ttl.text = " / " + _bd.totalTime.toFixed(0);
		}
		
		private function showCurrentTime():void
		{
			if (!_ctl) {
				_ctl = new TextField();
				_ctl.x = 700;
				addChild(_ctl);
				_ctl.text = _bd.currentTime.toFixed(1);
			} else {
				_ctl.text = _bd.currentTime.toFixed(1);
			}
		}
		
		private function showVideo():void
		{
			_v.width = 300;
			_v.height = 200;
			addChild(_v);
			addEventListener(Event.ENTER_FRAME, enterFreamHandler);
		}
		
		protected function enterFreamHandler(event:Event):void
		{
			showCurrentTime();
		}
		
	}
}