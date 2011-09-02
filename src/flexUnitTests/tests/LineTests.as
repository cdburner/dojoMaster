package flexUnitTests.tests
{
	import entities.Line;
	
	import org.flexunit.Assert;
	
	
	public class LineTests
	{
		[Test]
		public function TestLineCreationIsNotNull():void
		{
			var line:Line = new Line();
			Assert.assertNotNull(line);
		}
		
		[Test]
		public function lineContentHasBeenAdded():void
		{
			var line:Line = new Line();
			line.addContent("To be or not to be");
			
			Assert.assertEquals("To be or not to be", line.getContent());
		}
		
		[Test]
		public function lineContentAddedLastOverwritesPreviousAddedContent():void
		{
			var line:Line = new Line();
			line.addContent("To be or not to be");
			line.addContent("That is the question");
			
			Assert.assertEquals("That is the question", line.getContent());
		}
		
		[Test]
		public function returnsNothingIfNoContentAdded():void
		{
			var line:Line = new Line();
			
			Assert.assertEquals("",line.getContent());
		}
		
		[Test]
		public function getLengthOfContentWithNoAddedContent():void
		{
			var line:Line = new Line();
			
			Assert.assertEquals(0,line.getLength());
		}
		
		[Test]
		public function getLengthOfAddedContent():void
		{
			var line:Line = new Line();
			line.addContent("To be or not to be");
			
			Assert.assertEquals(18, line.getLength());
		}
		
		[Test]
		public function DoesNextCharGiveMeFirstLetterOfContent():void
		{
			var line:Line = new Line();
			line.addContent("To be or not to be");
			
			Assert.assertEquals("T", line.nextChar());
		}
		
		[Test]
		public function CallingNextCharGive4Times():void
		{
			var line:Line = new Line();
			line.addContent("123456");
			line.nextChar();
			line.nextChar();
			line.nextChar();
			var letter:String = line.nextChar();
			
			Assert.assertEquals("4", letter);
		}
		
		[Test]
		public function afterResetCalledNextCharIsFirstLetter():void
		{
			var line:Line = new Line();
			line.addContent("abcdef");
			line.nextChar();
			line.nextChar();
			line.reset();
			var letter:String = line.nextChar();
			
			Assert.assertEquals("a",letter);
		}
		
		[Test]
		public function resetCalledAfterAddedContent():void
		{
			var line:Line = new Line();
			line.addContent("abcdef");
			line.nextChar();
			line.nextChar();
			line.addContent("123456");
			var letter:String = line.nextChar();
			
			Assert.assertEquals("1",letter);
		}
		
		[Test]
		public function nextCharCalledMoreTimesThanLengthReturnsEmpty():void
		{
			var line:Line = new Line();
			line.addContent("abc");
			line.nextChar();
			line.nextChar();
			line.nextChar();
			line.nextChar();
			line.nextChar();
			var letter:String = line.nextChar();
			
			Assert.assertEquals("",letter);
		}
		
		[Test]
		public function isNextCharAvailableisTrue():void
		{
			var line:Line = new Line();
			line.addContent("abc");
			line.nextChar();
			line.nextChar();
			var res:Boolean = line.nextCharAvailable();
			
			Assert.assertEquals(true,res);
		}
		
		[Test]
		public function isNextCharAvailableisFalse():void
		{
			var line:Line = new Line();
			line.addContent("abc");
			line.nextChar();
			line.nextChar();
			line.nextChar();
			var res:Boolean = line.nextCharAvailable();
			
			Assert.assertEquals(false,res);
		}
	}
}