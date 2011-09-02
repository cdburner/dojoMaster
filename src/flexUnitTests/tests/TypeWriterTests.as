package flexUnitTests.tests
{
	import commands.Clock;
	import commands.Output;
	import commands.TypeWriter;
	
	import entities.Line;
	import entities.Lines;
	
	import org.flexunit.Assert;
	
	public class TypeWriterTests
	{
		private var line:Line;
		private var lines:Lines;
		
		[Before]
		public function setUp():void
		{
			lines = new Lines();
			line = new Line();
			line.addContent("To be or not to be");
			lines.addLine(line);
			line = new Line();
			line.addContent("Romeo Romeo where art thou Romeo");
			lines.addLine(line);
			
		}
		
		[After]
		public function tearDown():void
		{
			line = null;
			lines = null;
		}
		
		[Test]
		public function TypeWriterObjectNotNull():void
		{
			var tw:TypeWriter = new TypeWriter();
			
			Assert.assertNotNull(tw);
		}
		
		[Test]
		public function TypeWriterFirstChar():void
		{
			var tw:TypeWriter = new TypeWriter();
			tw.lines = lines;
			
			Assert.assertEquals("T",tw.nextChar());
		}
		
		[Test]
		public function TypeWriterFirstCharSecondLine():void
		{
			var tw:TypeWriter = new TypeWriter();
			tw.lines = lines;
			tw.lines.nextLine();//First line
			tw.lines.nextLine();//Second line
			
			Assert.assertEquals("R",tw.nextChar());
		}
		
		[Test]
		public function TypeWriterClockIsNotNull():void
		{
			var tw:TypeWriter = new TypeWriter();
			var clock:Clock = new Clock();
			tw.setClock(clock);
			
			Assert.assertNotNull(tw.getClock());
		}
		
		[Test]
		public function TypeWriterClockIsNull():void
		{
			var tw:TypeWriter = new TypeWriter();
			var clock:Clock = tw.getClock();
			Assert.assertNull(clock);
		}
		
		[Test]
		public function TypeWriterOutputIsNotNull():void
		{
			var tw:TypeWriter = new TypeWriter();
			var out:Output = new Output();
			tw.setOutput(out);
			
			Assert.assertNotNull(tw.getOutput());
		}
		
		[Test]
		public function TypeWriterOutputIsNull():void
		{
			var tw:TypeWriter = new TypeWriter();
			var out:Output = tw.getOutput();
			
			Assert.assertNull(out);
		}
		
		[Test]
		public function pulseTypeWriterIsOutputEqualToNextChar():void
		{
			var tw:TypeWriter = new TypeWriter();
			var lines:Lines = new Lines();
			var line:Line = new Line();
			var out:Output = new Output();
			line.addContent("Romeo Romeo");
			lines.addLine(line);
			tw.lines = lines;
			tw.setOutput(out);
			tw.pressKey();
			
			Assert.assertEquals("R", out.content());	
		}
		
		[Test]
		public function pulseTypeWriterManyTimesIsOutputChars():void
		{
			var tw:TypeWriter = new TypeWriter();
			var lines:Lines = new Lines();
			var line:Line = new Line();
			var out:Output = new Output();
			line.addContent("Romeo Romeo");
			lines.addLine(line);
			tw.lines = lines;
			tw.setOutput(out);
			tw.pressKey();
			tw.pressKey();
			tw.pressKey();
			tw.pressKey();
			tw.pressKey();
			
			Assert.assertEquals("Romeo", out.content());	
		}
	}
}