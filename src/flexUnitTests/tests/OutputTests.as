package flexUnitTests.tests
{
	import commands.Output;
	
	import org.flexunit.Assert;
	
	public class OutputTests
	{
		[Test]
		public function OutputIsNotNull():void
		{
			var out:Output = new Output();
			
			Assert.assertNotNull(out);
		}
		
		[Test]
		public function outputOneCharIn():void
		{
			var out:Output = new Output();
			out.charIn("S");
			
			Assert.assertEquals("S",out.content());
		}
		
		[Test]
		public function outputManyCharIn():void
		{
			var out:Output = new Output();
			out.charIn("S");
			out.charIn("e");
			out.charIn("e");
			
			Assert.assertEquals("See",out.content());
		}
	}
}