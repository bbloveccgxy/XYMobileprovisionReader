# XYMobileprovisionReader
a framework for getting the mobileprovision file information

## Usage

* Init with mobileprovision path

	`let reader = MobileprovisionReader(path:"some.mobileprovision")`
	
* Call `getInfo()`
	
	`let info = mobileprovisionReader.getInfo()`
	
* info will contain some information of the some.mobileprovision
	
	```
	info.uuid
	info.teamName
	info.teamIdentifier
	info.bundleIdentifier
	info.appIDName
	info.expirationDate
	info.creationDate
	info.name
	info.version
	```
	
* Use `info.description()` to print the strings above