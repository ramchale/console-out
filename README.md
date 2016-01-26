#console-out

[![Build Status](https://travis-ci.org/ramchale/console-out.svg?branch=master)](https://travis-ci.org/ramchale/console-out)

## Description
A library for basic colourization and formatting of console output.

Most of the core functionality was extracted from [HaxePunk](https://github.com/HaxePunk/HaxePunk) and restructured to make it more widely usable.

Output of these commands is not supported on Windows so the library will skip sending these commands on a Windows system.

## Example

```
ConsoleOut.print("Hi", Color.Red);
