package commands
{
	public class Output implements IOutput
	{
		private var chars:String;
		
		public function Output()
		{
			chars="";
		}
		
		public function charIn(char:String):void
		{
			chars+= char;
		}
		
		public function content():String
		{
			return chars;
		}
	}
}