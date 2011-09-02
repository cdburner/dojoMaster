package commands
{
	public interface ITimer extends ICommand
	{
		function set interval(frequency:uint):void;
		function get interval():uint;
		function stop():void;
	}
}