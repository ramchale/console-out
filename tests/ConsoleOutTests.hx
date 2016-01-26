package;

import haxe.unit.TestCase;
import org.hamcrest.MatcherAssert;
import org.hamcrest.core.IsEqual;

import consoleout.ConsoleOut;

class ConsoleOutTests extends TestCase
{
    public function testResetCode()
    {
        ConsoleOut.outputCommands = true;

        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(), IsEqual.equalTo("\x1B[0m"));

        currentTest.done = true;
    }

    public function testForegroundColorCodes()
    {
        ConsoleOut.outputCommands = true;

        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(Color.Black), IsEqual.equalTo("\x1B[30m"));
        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(Color.Red), IsEqual.equalTo("\x1B[31m"));
        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(Color.Green), IsEqual.equalTo("\x1B[32m"));
        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(Color.Yellow), IsEqual.equalTo("\x1B[33m"));
        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(Color.Blue), IsEqual.equalTo("\x1B[34m"));
        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(Color.Magenta), IsEqual.equalTo("\x1B[35m"));
        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(Color.Cyan), IsEqual.equalTo("\x1B[36m"));
        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(Color.White), IsEqual.equalTo("\x1B[37m"));

        currentTest.done = true;
    }

    public function testBackgroundColorCodes()
    {
        ConsoleOut.outputCommands = true;

        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(null, Color.Black), IsEqual.equalTo("\x1B[40m"));
        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(null, Color.Red), IsEqual.equalTo("\x1B[41m"));
        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(null, Color.Green), IsEqual.equalTo("\x1B[42m"));
        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(null, Color.Yellow), IsEqual.equalTo("\x1B[43m"));
        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(null, Color.Blue), IsEqual.equalTo("\x1B[44m"));
        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(null, Color.Magenta), IsEqual.equalTo("\x1B[45m"));
        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(null, Color.Cyan), IsEqual.equalTo("\x1B[46m"));
        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(null, Color.White), IsEqual.equalTo("\x1B[47m"));

        currentTest.done = true;
    }

    public function testDisplayAttributeCodes()
    {
        ConsoleOut.outputCommands = true;

        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(null, null, DisplayAttribute.Reset), IsEqual.equalTo("\x1B[0m"));
    	MatcherAssert.assertThat(ConsoleOut.textFormatCodes(null, null, DisplayAttribute.Bold), IsEqual.equalTo("\x1B[1m"));
    	MatcherAssert.assertThat(ConsoleOut.textFormatCodes(null, null, DisplayAttribute.Faint), IsEqual.equalTo("\x1B[2m"));
    	MatcherAssert.assertThat(ConsoleOut.textFormatCodes(null, null, DisplayAttribute.Italic), IsEqual.equalTo("\x1B[3m"));
    	MatcherAssert.assertThat(ConsoleOut.textFormatCodes(null, null, DisplayAttribute.Underline), IsEqual.equalTo("\x1B[4m"));
    	MatcherAssert.assertThat(ConsoleOut.textFormatCodes(null, null, DisplayAttribute.Blink), IsEqual.equalTo("\x1B[5m"));
    	MatcherAssert.assertThat(ConsoleOut.textFormatCodes(null, null, DisplayAttribute.BlinkRapid), IsEqual.equalTo("\x1B[6m"));
    	MatcherAssert.assertThat(ConsoleOut.textFormatCodes(null, null, DisplayAttribute.Negative), IsEqual.equalTo("\x1B[7m"));
    	MatcherAssert.assertThat(ConsoleOut.textFormatCodes(null, null, DisplayAttribute.Conceal), IsEqual.equalTo("\x1B[8m"));
    	MatcherAssert.assertThat(ConsoleOut.textFormatCodes(null, null, DisplayAttribute.CrossedOut), IsEqual.equalTo("\x1B[9m"));

        currentTest.done = true;
    }

    public function testMultipleCodes()
    {
        ConsoleOut.outputCommands = true;

        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(Color.Red, Color.Blue, DisplayAttribute.Bold), IsEqual.equalTo("\x1B[1;31;44m"));

        currentTest.done = true;
    }

    public function testUnformattedOutput()
    {
        ConsoleOut.outputCommands = false;
        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(), IsEqual.equalTo(""));
        MatcherAssert.assertThat(ConsoleOut.textFormatCodes(Color.Red, Color.Green, DisplayAttribute.Bold), IsEqual.equalTo(""));

        currentTest.done = true;
    }
}
