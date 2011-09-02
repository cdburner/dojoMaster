package flexUnitTests.tests
{
	import commands.Clock;
	import commands.TypeWriter;
	
	import entities.Line;
	import entities.Lines;
	
	import org.flexunit.Assert;
	
	public class ClockTests
	{
		[Test]
		public function ClockIsNotNull():void
		{
			var clock:Clock = new Clock();
			
			Assert.assertNotNull(clock);
		}
		
		[Test]
		public function setIntervalOfClock():void
		{
			var clock:Clock = new Clock();
			clock.interval = 300;
			
			Assert.assertEquals(300, clock.interval);
		}
		
		[Test]
		public function clocksTypeWriterIsNotNull():void
		{
			var tw:TypeWriter = new TypeWriter();
			var clock:Clock = new Clock();
			clock.setTypeWriter(tw);
			
			Assert.assertNotNull(clock.getTypeWriter());
		}
		
		[Test]
		public function clocksTypeWriterIsNull():void
		{
			var clock:Clock = new Clock();
			
			Assert.assertNull(clock.getTypeWriter());
		}
	}
}