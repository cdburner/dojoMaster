package flexUnitTests.tests
{
	import entities.Line;
	import entities.Lines;
	
	import org.flexunit.Assert;
	
	public class LinesTests
	{
		private var lines:Lines;
		
		[Before]
		public function setUp():void
		{
			lines = new Lines();
		}
		
		[After]
		public function tearDown():void
		{
			lines = null;
		}
		
		[Test]
		public function TestLinesCreationIsNotNull():void
		{
			
			Assert.assertNotNull(lines);
		}
		
		[Test]
		public function isAddedLineSaved():void
		{
			var line:Line = new Line();
			line.addContent("To be or not to be");
			lines.addLine(line);
			var firstLine:Line = lines.nextLine();
			
			Assert.assertEquals("To be or not to be", firstLine.getContent());
		}
		
		[Test]
		public function areTwoLinesThatAreAddedSaved():void
		{
			var firstLine:Line = new Line();
			firstLine.addContent("To be or not to be");
			var secondLine:Line = new Line();
			secondLine.addContent("Romeo Romeo");
			lines.addLine(firstLine);
			lines.addLine(secondLine);
			
			Assert.assertEquals("To be or not to be", lines.nextLine().getContent());
			Assert.assertEquals("Romeo Romeo", lines.nextLine().getContent());
		}
		
		[Test]
		public function resetSetBackToFirstLine():void
		{
			var firstLine:Line = new Line();
			firstLine.addContent("To be or not to be");
			var secondLine:Line = new Line();
			secondLine.addContent("Romeo Romeo");
			var thirdLine:Line = new Line();
			thirdLine.addContent("...and the world is a stage");
			lines.addLine(firstLine);
			lines.addLine(secondLine);
			lines.addLine(thirdLine);
			lines.nextLine();
			lines.nextLine();
			lines.reset();
			
			Assert.assertEquals("To be or not to be",lines.nextLine().getContent());
		}
		
		[Test]
		public function isNullWhenNoMoreLinesAvailable():void
		{
			var firstLine:Line = new Line();
			firstLine.addContent("To be or not to be");
			var secondLine:Line = new Line();
			secondLine.addContent("Romeo Romeo");
			lines.addLine(firstLine);
			lines.addLine(secondLine);
			lines.nextLine();
			lines.nextLine();
			
			Assert.assertNull(lines.nextLine());
		}
		
		[Test]
		public function doesNextLineAvailableReturnTrue():void
		{
			var firstLine:Line = new Line();
			firstLine.addContent("To be or not to be");
			var secondLine:Line = new Line();
			secondLine.addContent("Romeo Romeo");
			lines.addLine(firstLine);
			lines.addLine(secondLine);
			lines.nextLine();
			
			Assert.assertTrue(lines.nextLineAvailable());
		}
		
		[Test]
		public function doesNextLineAvailableReturnFalse():void
		{
			var firstLine:Line = new Line();
			firstLine.addContent("To be or not to be");
			var secondLine:Line = new Line();
			secondLine.addContent("Romeo Romeo");
			lines.addLine(firstLine);
			lines.addLine(secondLine);
			lines.nextLine();
			lines.nextLine();
			var isFalse:Boolean = lines.nextLineAvailable();
			
			Assert.assertFalse(isFalse);
		}
		
		[Test]
		public function secondLineFourthCharacter():void
		{
			var firstLine:Line = new Line();
			firstLine.addContent("To be or not to be");
			var secondLine:Line = new Line();
			secondLine.addContent("Romeo Romeo");
			lines.addLine(firstLine);
			lines.addLine(secondLine);
			lines.nextLine();
			var aLine:Line = lines.nextLine();
			aLine.nextChar();
			aLine.nextChar();
			aLine.nextChar();
			var char:String = aLine.nextChar();
			
			Assert.assertEquals("e", char);
		}
		
		[Test]
		public function nextCharWorksOverTwolines():void
		{
			var aLine:Line = new Line();
			aLine.addContent("To");
			lines.addLine(aLine);
			aLine = new Line();
			aLine.addContent("be");
			lines.addLine(aLine);
			lines.nextChar();
			lines.nextChar();
			var char:String = lines.nextChar();
			
			Assert.assertEquals("b",char);
		}
		
		[Test]
		public function isNextCharAvailableTrueWithOneLine():void
		{
			var aLine:Line = new Line();
			aLine.addContent("To");
			lines.addLine(aLine);
			lines.nextChar();
			
			Assert.assertTrue(lines.nextCharAvailable());
		}
		
		[Test]
		public function isNextCharAvailableFalseWithOneLine():void
		{
			var aLine:Line = new Line();
			aLine.addContent("To");
			lines.addLine(aLine);
			lines.nextChar();
			lines.nextChar();
			
			Assert.assertFalse(lines.nextCharAvailable());
		}
		
		[Test]
		public function isNextCharAvailableTrueWithTwoLines():void
		{
			var aLine:Line = new Line();
			aLine.addContent("To");
			lines.addLine(aLine);
			aLine = new Line();
			aLine.addContent("be");
			lines.addLine(aLine);
			lines.nextChar();
			lines.nextChar();
			lines.nextChar();
			
			Assert.assertTrue(lines.nextCharAvailable());
		}
		
		[Test]
		public function isNextCharAvailableFalseWithTwoLines():void
		{
			var aLine:Line = new Line();
			aLine.addContent("To");
			lines.addLine(aLine);
			aLine = new Line();
			aLine.addContent("be");
			lines.addLine(aLine);
			lines.nextChar();
			lines.nextChar();
			lines.nextChar();
			lines.nextChar();
			
			Assert.assertFalse(lines.nextCharAvailable());
		}
	}
}