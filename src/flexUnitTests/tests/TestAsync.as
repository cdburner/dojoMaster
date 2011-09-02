package flexUnitTests.tests
{
	import commands.Clock;
	import commands.Output;
	import commands.TypeWriter;
	
	import entities.Line;
	import entities.Lines;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	
	public class TestAsync
	{
		private var FINISHED_TYPING:String = "finished typing";
		private var out:Output;
		
		[Before]
		public function setUp():void
		{
			
		}
		
		[After]
		public function tearDown():void
		{
			
		}
		
		
		[Test(async, description="Clock with typewriter and output")]
		public function isTypeWriterFinished():void
		{
			var tw:TypeWriter = new TypeWriter();
			var asyncHandler:Function = Async.asyncHandler(this, handleFinishedTyping, 1000, null,handleTimeout);
			tw.addEventListener(FINISHED_TYPING, asyncHandler, false, 0, true);
			var lines:Lines = new Lines();
			var line:Line = new Line();
			out = new Output();
			var tmr:Clock = new Clock();
			line.addContent("To"+"\n");
			lines.addLine(line);
			line = new Line();
			line.addContent("Be");
			lines.addLine(line);
			
			
			tw.lines = lines;
			tw.setOutput(out);
			tw.setClock(tmr);
			tmr.interval = 100;
			tmr.setTypeWriter(tw);
			tw.execute();
			
		}
		
		protected function handleFinishedTyping(event:Event, passThroughData:Object):void
		{
			trace(out.content());
		}
		
		protected function handleTimeout(passThroughData:Object):void
		{
			Assert.fail( "Timeout reached before event");
		}
	}
}