package commands
{
	import commands.TypeWriter;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Clock extends EventDispatcher implements ITimer
	{
		private var _interval:uint;
		private var _typeWriter:TypeWriter;
		private var tmr:Timer;
		
		public function Clock()
		{
		}
		
		public function set interval(frequency:uint):void
		{
			_interval = frequency;
		}
		
		public function get interval():uint
		{
			return _interval;
		}
		
		public function stop():void
		{
			tmr.removeEventListener(TimerEvent.TIMER, onTime);
		}
		
		public function execute():void
		{
			tmr = new Timer(_interval);
			tmr.addEventListener(TimerEvent.TIMER, onTime, false, 0, true);
			tmr.start();
		}
		
		private function onTime(evt:TimerEvent):void
		{
			_typeWriter.pressKey();
		}
		
		public function setTypeWriter(tw:TypeWriter):void
		{
			_typeWriter = tw;
		}
		
		public function getTypeWriter():TypeWriter
		{
			return _typeWriter;
		}
	}
}