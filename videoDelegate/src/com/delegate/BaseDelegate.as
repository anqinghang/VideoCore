package com.delegate
{
	import com.interfaces.IVideoData;
	import com.interfaces.delegate.IDelegate;
	import com.video.interfaces.IVideoSource;
	import com.video.source.BaseVideoSource;
	import com.video.source.VSInfo;
	
	import flash.media.Video;
	
	public class BaseDelegate implements IDelegate
	{
		private var _source:IVideoSource;
		private var _video:Video;
		private var _backFun:Function;
		private var _originalWidth:Number;
		private var _originalHeight:Number;
		private var _totalTime:Number;
		
		public function BaseDelegate()
		{
		}
		
		public function init(video:Video, conntionURL:String=null, streamURL:String=null, backFun:Function = null):void
		{
			if (!video) {
				if (backFun != null) {
					backFun.call(null, VSInfo.LOG, "video is null");
				}
				return;
			} else {
				_video = video;
			}
			
			_source = new BaseVideoSource();
			_source.connect(conntionURL, streamURL,
				function (type:String, value:String):void {
					switch (type) {
						case VSInfo.META_DATA :
							_originalWidth = _source.originalWidth;
							_originalHeight = _source.originalHeight;
							_totalTime = _source.totalTime;
							_video.attachNetStream(_source.stream);
							break;
					}
					if (backFun != null) {
						backFun.call(null, type, value);
					}
				}
			);
//			_video.attachNetStream(_source.stream);
		}
		
		public function togglePlay(value:Boolean = false):void
		{
			if (_source) {
				if (value) {
					_source.play();
				} else {
					_source.pause();
				}
			}
		}
		
		public function replay():void
		{
			seek(0);
		}
		
		public function seek(time:Number):Boolean
		{
			if (_source) {
				_source.time = time;
				return true;
			} else {
				return false;
			}
		}
		
		public function stop():void
		{
			if (_source) {
				_source.close();
			}
		}
		
		public function dispose():void
		{
//			if (_source) {
//				_source
//			}
		}
		
		public function get video():Video
		{
			return _video;
		}
		
		public function set video(value:Video):void {
			_video = value;
		}
		
		public function get source():IVideoSource
		{
			return _source;
		}
		
		public function get data():IVideoData
		{
			return null;
		}
		
		public function set data(value:IVideoData):void
		{
		}
		
		public function get isPlaying():Boolean
		{
			if (_source) {
//				_source
			}
			return true;
		}
		
		public function get isFinished():Boolean
		{
			return false;
		}
		
		public function set volume(value:int):void
		{
		}
		
		public function get volume():int
		{
			return 0;
		}
		
		public function get originalWidth():Number
		{
			return _originalWidth;
		}
		
		public function get originalHeight():Number
		{
			return _originalHeight;
		}
		
		
		
		public function get totalTime():Number
		{
			return _totalTime;
		}
		
		public function get currentTime():Number
		{
			if (_source){
				return _source.stream.time;
			} else {
				return 0;
			}
		}
		
	}
}