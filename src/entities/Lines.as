package entities
{
	import entities.Line;
	
	public class Lines
	{
		private var lines:Array;
		private var lineIndex:int;
		
		public function Lines()
		{
			lines = new Array();
			lineIndex = -1;
		}
		
		public function addLine(aLine:Line):void
		{
			lines.push(aLine);
		}
		
		public function nextLine():Line
		{
			lineIndex++;
			return lines[lineIndex];
		}
		
		public function nextLineAvailable():Boolean
		{

			if (lineIndex >= (lines.length- 1))
			{
				return false;
			}
			else
			{
				return true;
			}
		}
		
		public function nextCharAvailable():Boolean
		{
			if ((nextLineAvailable()) || (lines[lineIndex].nextCharAvailable()))
			{
				return true
			}
			else
			{
				return false;
			}
		}
		
		public function nextChar():String
		{
			if (lineIndex == -1)
			{
				lineIndex++;
			}
			
			if (lines[lineIndex].nextCharAvailable() == false)
			{
				lineIndex++;
			}
			return lines[lineIndex].nextChar();
		}
		
		public function reset():void
		{
			lineIndex = -1;
		}
	}
}