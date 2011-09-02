package commands
{
	import entities.Lines;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class TypeWriter extends EventDispatcher implements ICommand
	{
		private var _speed:uint;
		private var _lines:Lines;
		private var clock:Clock;
		private var output:Output;
		
		public function TypeWriter()
		{
			_lines = new Lines();
		}
		
		public function execute():void
		{
			clock.execute();
		}

		public function get lines():Lines
		{
			return _lines;
		}

		public function set lines(value:Lines):void
		{
			_lines = value;
		}
		
		public function nextChar():String
		{
			if (lines.nextCharAvailable())
			{
				return _lines.nextChar();
			}
			else
			{
				finishedTyping();
				return "";
			}
		}
		
		private function finishedTyping():void
		{
			clock.stop();
			dispatchEvent(new Event("finished typing",true));
		}
			

		public function get speed():uint
		{
			return _speed;
		}

		public function set speed(value:uint):void
		{
			_speed = value;
		}
		
		public function setClock(aClock:Clock):void
		{
			clock = aClock;
		}
		
		public function getClock():Clock
		{
			return clock;
		}
		
		public function setOutput(aOutput:Output):void
		{
			output = aOutput;
		}
		
		public function getOutput():Output
		{
			return output;
		}

		public function pressKey():void
		{
			output.charIn(nextChar());
		}

	}
}