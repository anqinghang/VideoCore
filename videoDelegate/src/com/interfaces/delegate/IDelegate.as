package com.interfaces.delegate
{
	import com.interfaces.IVideoData;
	import com.video.interfaces.IVideoSource;
	
	import flash.media.Video;

	public interface IDelegate
	{
		/**
		 * 通过视频数据初始化视频管理类 
		 * @param videoData
		 */		
		function init(video:Video, conntionURL:String=null, streamURL:String = null, backFun:Function = null):void;
		/**
		 * 播放/暂停 
		 * @param value
		 */		
		function togglePlay(value:Boolean = false):void;
		/**
		 * 重播 
		 */		
		function replay():void;
		/**
		 * 变更进度 
		 * @param time
		 * @return 
		 */		
		function seek(time:Number):Boolean;
		/**
		 * 停止播放 
		 */		
		function stop():void;
		/**
		 * 停止播放并销毁视频资源 
		 */		
		function dispose():void;
		/**
		 * 视频封装 
		 * @return 
		 */		
		function get video():Video;
		/**
		 * 视频源数据封装 
		 * @return 
		 */		
		function get source():IVideoSource;
		/**
		 * 视频数据 
		 * @return 
		 */		
		function get data():IVideoData;
		function set data(value:IVideoData):void;
		/**
		 * 是否正在播放 
		 * @return 
		 */		
		function get isPlaying():Boolean;
		/**
		 * 是否播放结束 
		 * @return 
		 */		
		function get isFinished():Boolean;
		/**
		 * 设置/获取音量 
		 * @param value
		 */		
		function set volume(value:int):void;
		function get volume():int;
		/**
		 * 原始宽度
		 *  
		 * @return 
		 */		
		function get originalWidth():Number;
		/**
		 * 原始高度
		 *  
		 * @return 
		 */		
		function get originalHeight():Number;
	}
}