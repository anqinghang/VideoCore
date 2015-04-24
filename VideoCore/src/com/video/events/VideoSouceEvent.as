package com.video.events
{
	import flash.events.Event;
	
	public class VideoSouceEvent extends Event
	{
		public static const VIDEO_SOURCE_INFO:String = "videoSourceInfo";
		
		public var info:String = "";
		
		public function VideoSouceEvent(type:String, info:String = "")
		{
			super(type, bubbles, cancelable);
			info = info;
		}
	}
}