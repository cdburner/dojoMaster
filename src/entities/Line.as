package entities
{
	public class Line
	{
		private var content:String;
		private var position:int;
		
		public function Line()
		{
			content = "";
			reset();
		}
		
		public function addContent(someContent:String):void
		{
			content = someContent;
			reset();
		}
		
		public function getContent():String
		{
			return content;
		}
		
		public function getLength():int
		{
			return content.length;
		}
		
		public function nextChar():String
		{
			position++;
			//if (!isNextCharAvailable()) position = getLength() - 1;
			return content.substr(position,1);
		}
		
		public function reset():void
		{
			position = -1;
		}
		
		public function nextCharAvailable():Boolean
		{
			if (position >= (getLength()-1))
			{
				return false;
			}
			else
			{
				return true;
			}
		}
	}
}