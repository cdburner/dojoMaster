package flexUnitTests
{
	import flexUnitTests.tests.OutputTests;
	import flexUnitTests.tests.ClockTests;
	import flexUnitTests.tests.LineTests;
	import flexUnitTests.tests.LinesTests;
	import flexUnitTests.tests.TestAsync;
	import flexUnitTests.tests.TypeWriterTests;
	
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class DojoTestSuite
	{
		public var line:LineTests;
		public var lines:LinesTests;
		public var tw:TypeWriterTests;
		public var async:TestAsync;
		public var cl:ClockTests;
		public var out:OutputTests;
	}
}