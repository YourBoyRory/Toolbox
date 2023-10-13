if FileExist("\Portable Software\Bumpscosity") {
	FileRead, bumpscosity, %CD%\Portable Software\Bumpscosity
} else {
	global bumpscosity := 500
}

if FileExist("\Portable Software\ghostModeAlways") {
	global ghostModeAlways := true
} else {
	global ghostModeAlways := false
}

FileRead, brightness, %CD%\Portable Software\ghostModeData
If (brightness = "") {
	global brightness := 230
} 

if FileExist("\Portable Software\ghostMode") {
	global ghostMode := true
} else {
	global ghostMode := false
}

if FileExist("\Portable Software\98iscool") {
	DllCall("uxtheme.dll\SetThemeAppProperties", "UInt", 0)
	global 9XMode := true
} else {
	global 9XMode := false
}

if FileExist("\Portable Software\onTop") {
	Gui, +AlwaysOnTop
	global onTopBoot := true 
	global onTop := true
} else {
	global onTopBoot := false
	global onTop := false
}

if FileExist("\Portable Software\darkMode") {
	DllCall("dwmapi\DwmSetWindowAttribute", "ptr", A_ScriptHwnd, "int", attr, "int*", true, "int", 4)
	Gui, Color,333333
	Gui, Two: Color, 333333
	Gui, Font, cFFFFFF
	Gui, Two: Font, cFFFFFF
	global darkMode := true
} else {
	global darkMode := false
}

	focusYes := 1
	global sectionCount := 0
	global appCount
	global iconNum = 2
	global perCount := 0
	global percent := 0
	
	; Config
	global formatX := 215
	global formatY := 10
	global totalApps := 74
	global toolboxVersion := "Toolbox v1.8"


Gui, Two: Add, Text, y+10 w270 vSec, Loading Home...
Gui, Two: Add, Text, y+5 w270 vApp, Home
Gui, Two: Add, Text, y+5 w60 vPer,%percent%`%


if (9XMode = true) {
	Gui, Two: Add, Progress, w129 c0000a8 vMyProgress
} else {
	Gui, Two: Add, Progress, w129 BackgroundC9C9C9 vMyProgress
}
Gui, Two: +AlwaysOnTop -caption
;-SysMenu +Owner +Disabled 
Gui, Two: Show, w150 h95, Toolbox Loading

; Add Apps
{	
	global ImageListID := IL_Create(1,65535)
	IL_Add(ImageListID, "shell32.dll", 3) ; fallback icon 
	

	if (darkMode = true) {
		Gui, Add, TreeView, gClick %formatY% w200 h400 vTree ImageList%ImageListID% -ReadOnly -WantF2 Background454545
	} else {
		Gui, Add, TreeView, gClick %formatY% w200 h400 vTree ImageList%ImageListID% -ReadOnly -WantF2
	}

	Gui, Add, Tab, x-2 y-22 w600 h500 vTab -wrap
		Home 			:= addHome("Home", "ieframe.dll", 1)
	
	
	;	Tree ID			:= addApp("Lable", Icon Path, Icon Number, Section)
	
	Utilities	:= addSection("Utilities", "imageres.dll", 4)
		7Zip			:= addApp("7-Zip", "\Portable Software\7-ZipPortable\7-ZipPortable.exe", 1, Utilities)
		AdvancedRun		:= addApp("AdvancedRun", "\Portable Software\AdvancedRun\AdvancedRun.exe",1, Utilities)
		BCU				:= addApp("BCUninstaller", "\Portable Software\BCUninstaller_5.1_portable\BCUninstaller.exe", 1, Utilities)
		Eraser			:= addApp("Eraser", "\Portable Software\EraserPortable\EraserPortable.exe", 1, Utilities)
		Etcher			:= addApp("Etcher", "\Portable Software\Etcher\Etcher.exe", 1, Utilities)
		Firefox			:= addApp("Firefox", "\Portable Software\FirefoxPortable\FirefoxPortable.exe", 1, Utilities)
		getProductKey	:= addApp("Get ProductKey", "shell32.dll", 72, Utilities)
		godMode			:= addApp("GodMode", "shell32.dll", 22, Utilities)
		HxD				:= addApp("HxD", "\Portable Software\HxD\HxD.exe", 1, Utilities)
		Notepad			:= addApp("Notepad++", "\Portable Software\Notepad++Portable\Notepad++Portable.exe", 1, Utilities)
		Rufus			:= addApp("Rufus", "\Portable Software\RufusPortable\RufusPortable.exe", 1, Utilities)
		RyzenMaster		:= addApp("RyzenMaster", "\Portable Software\RyzenMaster\bin\AMD Ryzen Master.exe", 1, Utilities)
		WhyNotWin11		:= addApp("WhyNotWin11", "\Portable Software\WhyNotWin11\WhyNotWin11.exe", 1, Utilities)
		WinaeroTweaker	:= addApp("Winaero Tweaker", "\Portable Software\Winaero Tweaker\WinaeroTweaker.exe", 1, Utilities)
		WinDirStat		:= addApp("WinDirStat", "\Portable Software\WinDirStatPortable\WinDirStatPortable.exe", 1, Utilities)
		ZFX				:= addApp("Zip2Fix", "\Portable Software\ZFX\ZFX.exe", 1, Utilities)
	
	Diagnostic	:= addSection("Diagnostic", "imageres.dll", 4)
		Autoruns		:= addApp("Autoruns", "\Portable Software\AutorunsPortable\AutorunsPortable.exe", 1, Diagnostic)
		CCleaner		:= addApp("CCleaner", "\Portable Software\ccPortable\ccPortable.exe", 1, Diagnostic)
		h2testw			:= addApp("h2testw", "\Portable Software\h2testw\h2testw.exe", 1, Diagnostic)
		HijackThis		:= addApp("HijackThis", "\Portable Software\HijackThisPortable\HijackThisPortable.exe", 1, Diagnostic)
		IPDT			:= addApp("IPDT", "shell32.dll", 3, Diagnostic)
		KasperskyDecr	:= addApp("Kaspersky Decryptor", "\Portable Software\KasperskyTDSSKillerPortable\KasperskyTDSSKillerPortable.exe", 1, Diagnostic)
		KasperskyTDS	:= addApp("Kaspersky Anti-Root", "\Portable Software\KasperskyTDSSKillerPortable\KasperskyTDSSKillerPortable.exe", 1, Diagnostic)
		McAfee			:= addApp("McAfee", "\Portable Software\McAfeeStingerPortable\McAfeeStingerPortable.exe", 1, Diagnostic)
		pestudio		:= addApp("pestudio", "\Portable Software\pestudio\pestudio.exe", 1, Diagnostic)
		ProcExp			:= addApp("ProcessExplorer", "\Portable Software\ProcessExplorer\procexp64.exe", 1, Diagnostic)
		ProcMon			:= addApp("ProcessMonitor", "\Portable Software\ProcessMonitor\Procmon64.exe", 1, Diagnostic)
		RCV 			:= addApp("Recuva", "\Portable Software\rcvPortable\rcvPortable.exe", 1, Diagnostic)
		SeaTools		:= addApp("SeaTools", "\Portable Software\seatools\SeaToolsforWindows.exe", 1, Diagnostic)
		TCPView			:= addApp("TCPView", "\Portable Software\TCPView\tcpview.exe", 1, Diagnostic)
		
	SystemInfo	:= addSection("System Info", "imageres.dll", 4)
		coretemp		:= addApp("CoreTemp", "\Portable Software\CoreTemp64\Core Temp.exe", 1, SystemInfo)
		CPUZ			:= addApp("CPU-Z", "\Portable Software\CPU-ZPortable\CPU-ZPortable.exe", 1, SystemInfo)
		CrystalDiskInfo	:= addApp("CrystalDiskInfo", "\Portable Software\CrystalDiskInfoPortable\CrystalDiskInfoPortable.exe", 1, SystemInfo)
		aida64			:= addApp("Aida64", "\Portable Software\aida64\aida64.exe", 1, SystemInfo)
		GPUZ			:= addApp("GPU-Z", "\Portable Software\GPU-ZPortable\GPU-ZPortable.exe", 1, SystemInfo)
		HWiNFO			:= addApp("HWiNFO", "\Portable Software\hwi_710\HWiNFO64.exe", 1, SystemInfo)
		bruhtemp		:= addSubSection("RealTemp", "\Portable Software\RealTemp\RealTemp.exe", 1, SystemInfo)
			temptemp	:= addApp("RealTemp ", "\Portable Software\RealTemp\RealTemp.exe", 1, bruhtemp)
			realtempgt		:= addApp("RealTempGT", "\Portable Software\RealTemp\RealTempGT.exe", 1, bruhtemp)
			turbogt			:= addApp("i7TurboGT", "\Portable Software\RealTemp\i7TurboGT.exe", 1, bruhtemp)
	
	Benchmark	:= addSection("Benchmark", "imageres.dll", 4)
		Cinebench		:= addApp("Cinebench", "\Portable Software\CinebenchR23\Cinebench.exe", 1, Benchmark)
		CrystalDiskMark	:= addApp("CrystalDiskMark", "\Portable Software\CrystalDiskMarkPortable\CrystalDiskMarkPortable.exe", 1, Benchmark)
		Kombustor		:= addApp("Kombustor", "\Portable Software\MSI Kombustor 4 x64\MSI-Kombustor-x64.exe", 1, Benchmark)
		occt			:= addApp("OCCT", "\Portable Software\OCCT\OCCT.exe", 1, Benchmark)
		prime95			:= addApp("Prime95", "\Portable Software\Prime95\prime95.exe", 1, Benchmark)
		QwikMark		:= addApp("QwikMark", "\Portable Software\QwikMarkPortable\QwikMarkPortable.exe", 1, Benchmark)
		unigine			:= addSubSection("UNIGINE", "\Portable Software\unigine\HeavenBenchmark\heaven.ico", 1, Benchmark)
			superposition	:= addApp("Superposition", "\Portable Software\unigine\Superposition Benchmark\Superposition.exe", 1, unigine)
			valley			:= addApp("Valley", "\Portable Software\unigine\ValleyBenchmark\icon.ico", 1, unigine)
			heaven			:= addApp("Heaven", "\Portable Software\unigine\HeavenBenchmark\heaven.ico", 1, unigine)
	
	Commands	:= addSection("Commands", "imageres.dll", 4)
		DNR				:= addApp("Diag and Repair", "console.dll", 1, Commands)
        PCTUNEUP        := addApp("PC Tune-up", "console.dll", 1, Commands)
		CHKDSK			:= addApp("chkdsk", "console.dll", 1, Commands)
		DEFRAG			:= addApp("defrag", "console.dll", 1, Commands)
		DISM			:= addApp("DISM.exe", "console.dll", 1, Commands)
		SFC				:= addApp("sfc /scannow", "console.dll", 1, Commands)
		
	
	Installers	:= addSection("Installers", "imageres.dll", 4)
		Malwarebytes	:= addApp("Malwarebytes", "msi.dll", 3, Installers)
		InstallChrome	:= addApp("Chrome", "msi.dll", 3, Installers)
		InstallFirefox	:= addApp("Firefox", "msi.dll", 3, Installers)
		Essentials		:= addApp("Essentials", "msi.dll", 3, Installers)
		Gaming			:= addApp("Gaming Essentials", "msi.dll", 3, Installers)
		Editing			:= addApp("Editing Essentials", "msi.dll", 3, Installers)
		Recommended		:= addApp("Recommendations", "msi.dll", 3, Installers)
		Ninite			:= addApp("Ninite", "\Portable Software\Installers\Recommended.exe", 1, Installers)
		Windows10		:= addApp("Windows 10", "\Portable Software\Installers\Windows10MediaCreationTool.exe", 1, Installers)
		Windows11		:= addApp("Windows 11", "\Portable Software\Installers\Windows11InstallationAssistant.exe", 1, Installers)
		Other			:= addApp("Other", "shell32.dll", 46, Installers)
		
	Settings	:= addSettings("Settings", "imageres.dll", 110)
		
}	

; GUI
{



	TV_Modify(Installers, "Expand")
	TV_Modify(Commands, "Expand")
	TV_Modify(Benchmark, "Expand")
	TV_Modify(SystemInfo, "Expand")
	TV_Modify(Diagnostic, "Expand")
	TV_Modify(Utilities, "Expand")
	TV_Modify(Home, "Expand")

	Gui, Tab,% "Other"
	Gui, Add, Text, x218 y372 w100 vreadOther, 
	
	Gui, Tab,% "Settings"
	Gui, Add, Text, x218 y377 h200 w175 vreadSettings, 
	Gui, Add, Text, x298 y293 w25 vsetBumpscosity, %bumpscosity%
	
	Gui, Two: Destroy
	Gui, Show, w524 h416, Toolbox
	if (ghostMode = true) {
		if (ghostModeAlways = true) {
			WinSet, Transparent, %brightness%, Toolbox
		}
		if (ghostModeAlways = false) {
			SetTimer,focus,100
		}
	}
	
	return
	GuiEscape:
	GuiClose:
		ExitApp
		
}


; Map Apps
{
Click:
	mapSection(Home)
	mapSection(Utilities)
	mapSection(Diagnostic)
	mapSection(SystemInfo)
	mapSection(Benchmark)
	mapSection(Commands)
	mapSection(Installers)
	
	; mapSubSection(Sub Section ID, Height of Boarder, "App Description")
	
	mapSubSection(bruhtemp, 362, "4 apps for monitoring temperature. Designed for all Intel single Core, Dual Core, Quad Core and Core i7 processors.")
	mapSubSection(unigine, 362, "UNIGINE Benchmarks can be effectively used to determine the stability of PC hardware (CPU, GPU, power supply, cooling system) under extremely stressful conditions, as well as for overclocking. `n`nExtreme performance and stability test for PC hardware: video card, power supply, cooling system. Check your rig in stock and overclocking modes with real-life load! Also includes interactive experience in a beautiful, detailed environment.")
	
	
	; mapApp(App ID, "Path To App", Elevated, "App Description")
	
	; Utilities
	mapApp( 7Zip, "\7-ZipPortable\7-ZipPortable.exe", 0, "Open-source file archiver")
	mapApp( AdvancedRun, "\AdvancedRun\AdvancedRun.exe", 1, "Allows you to run the program with different users and/or permissions.")
	mapApp( BCU, "\BCUninstaller_5.1_portable\BCUninstaller.exe", 0, "Bulk program uninstaller with advanced automation. Can be used to remove bloatware.")
	mapApp( Eraser, "\EraserPortable\EraserPortable.exe", 1, "A advanced secure file erasure tool. Eraser securely erases data by overwriting it such that the data is irrecoverable.")
	mapApp( Etcher, "\Etcher\Etcher.exe", 0, "Open-source utility used for writing disk images files onto storage media to create live SD cards and USB flash drives. This is not the same as Rufus as in it it used to write USB images to a USB rather then a DVD image to a USB.")
	mapApp( Firefox, "\FirefoxPortable\FirefoxPortable.exe", 0, "A free, secure, and open-source web browser.")
	mapApp( getProductKey, "\getProductkey\getProductKey.vbs", 0, "Gets the ProductKey used to activate windows. Useful for reactivating when reinstalling or upgrading.")
	mapApp( godMode, "\GodMode\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}", 0, "God Mode is a special option available in the past several versions of Windows that gives you quick access to most of the applets and commands from Control Panel. This is Useful when trying to find removed settings.")
	mapApp( HxD, "\HxD\HxD.exe", 0, "A hex editor, disk editor, and memory editor. It can open and edit the raw contents of disk drives, as well as display and edit the memory used by running processes.")
	mapApp( Notepad, "\Notepad++Portable\Notepad++Portable.exe", 0, "Powerful notepad alternative.")
	mapApp( Rufus, "\RufusPortable\RufusPortable.exe", 0, "Used to format and create bootable USB flash drives or Live USBs.")
	mapApp( RyzenMaster, "\RyzenMaster\bin\AMD Ryzen Master.exe", 0, "Ryzen Master is a cpu and iGPU overclocking software for AMD CPUs. It only works on AMD desktop CPUs and iGPUs")
	mapApp( WhyNotWin11	, "\WhyNotWin11\WhyNotWin11.exe", 0, "Detection Script to help identify why your PC isn't (or is) Windows 11 Release Ready.")
	mapApp( WinaeroTweaker, "\Winaero Tweaker\WinaeroTweaker.exe", 0, "Lets you adjust hidden secret settings that Microsoft does not let you adjust from the user interface. In addition, it allows you to add extra value to existing Windows apps and tools with advanced context menus, options, and handy commands.")
	mapApp( WinDirStat, "\WinDirStatPortable\WinDirStatPortable.exe", 0, "Powerful graphical disk usage analyzer. Shows whats eating your harddrive space.")
	mapApp( ZFX, "\ZFX\ZFX.exe", 0, "A program for repairing Zip archive files.")
	
	; Diagnostic
	mapApp(Autoruns, "\AutorunsPortable\AutorunsPortable.exe", 0, "Enumerates all the programs that automatically start on a Windows machine.")
	mapApp(CCleaner, "\ccPortable\ccPortable.exe", 0, "A utility used to clean potentially unwanted files and invalid Windows Registry entries from a computer.")
	mapApp(h2testw, "\h2testw\h2testw.exe", 0, "A tool to test storage media for counterfeit space claims.")
	mapApp(HijackThis, "\HijackThisPortable\HijackThisPortable.exe", 0, " A tool to detect malware and adware.")
	mapApp(IPDT, "\IPDT\startIPDT.bat", 1, " The Intel Processor Diagnostic Tool or IPDT is a software that can; Verify the functionality of all the cores of Intel Processor; Check for the brand identification; Verify the processor operating frequency; Test specific processor features; Perform a stress test on the processor. This app only works on intel CPUs. Uses a script I wrote to handle architecture differeces (64bit vs 32bit) and works around hard-coded directory calls")
	mapApp(KasperskyDecr, "\KasperskyCoinVaultDecryptor\CoinVaultDecryptor.exe", 0, "A Decryptor for the ransomeware CoinVault.")
	mapApp(KasperskyTDS, "\KasperskyTDSSKillerPortable\KasperskyTDSSKillerPortable.exe", 0, "A tool to detect and remove rootkits.")
	mapApp(McAfee, "\McAfeeStingerPortable\McAfeeStingerPortable.exe", 0, "A standalone utility used to detect and remove specific viruses.")
	mapApp(pestudio, "\pestudio\pestudio.exe", 0, " a tool to find suspicious artifacts within executable files to accelerate the first malware assessment.")
	mapApp(ProcExp, "\ProcessExplorer\procexp.exe", 0, "First party tool from Windows Sysinternals that is useful for tracking down DLL-version problems or handle leaks, and provide insight into the way Windows and applications work.")
	mapApp(ProcMon, "\ProcessMonitor\Procmon.exe", 0, "First party tool from Windows Sysinternals that monitors and displays in real-time all file system activity")
	mapApp(RCV, "\rcvPortable\rcvPortable.exe", 0, "Can recover pictures, music, documents, videos, emails or any other file type you’ve lost from any rewriteable media:`n`nmemory cards, external hard drives, USB sticks and more!")
	mapApp(SeaTools, "\seatools\SeaToolsforWindows.exe", 0, "Computer hard disk analysis software developed and released by Seagate Technology. It exists as a version for DOS and Microsoft Windows.")
	mapApp(TCPView, "\TCPView\tcpview.exe", 0, "A program that shows you a detailed listings of all TCP and UDP endpoints on your system.")
	
	; System Info
	mapApp(coretemp, "\CoreTemp64\Core Temp.exe", 0, "A compact, no fuss, small footprint, yet powerful program to monitor processor temperature and other vital information.")
	mapApp(CPUZ, "\CPU-ZPortable\CPU-ZPortable.exe", 0, "gathers information on some of the main devices of your system.")
	mapApp(CrystalDiskInfo, "\CrystalDiskInfoPortable\CrystalDiskInfoPortable.exe", 0, "A HDD/SSD utility software which supports a part of USB, Intel/AMD RAID and NVMe.")
	mapApp(aida64, "\aida64\aida64.exe", 0, "System information, diagnostics, and auditing application. It displays detailed information on the components of a computer.")
	mapApp(GPUZ, "\GPU-ZPortable\GPU-ZPortable.exe", 0, "lightweight system utility designed to provide vital information about your video card and graphics processor.")
	mapApp(HWiNFO, "\hwi_710\HWiNFO32.exe", 0, "Powerful tool for monitoring and reporting hardware. Provides In-depth Hardware Information, Real-Time System Monitoring, Reporting & more.")
		mapApp(temptemp, "\RealTemp\RealTemp.exe", 0, "A temperature monitoring program designed for all Intel single Core, Dual Core, Quad Core processors.")
		mapApp(realtempgt, "\RealTemp\RealTempGT.exe", 0, "RealTemp GT is for the 6 core CPUs.")
		mapApp(turbogt, "\RealTemp\i7TurboGT.exe", 0, "i7 RealTemp GT is for i7 CPUs.")
	
	; Benchmark
	mapApp( Cinebench, "\CinebenchR23\Cinebench.exe", 0, "Real-world test suite that evaluates your computer's hardware capabilities.")
	mapApp( CrystalDiskMark, "\CrystalDiskMarkPortable\CrystalDiskMarkPortable.exe", 0, "Simple disk benchmark software.")
	mapApp( Kombustor, "\MSI Kombustor 4 x64\MSI-Kombustor-x64.exe", 0, "MSI's burn-in benchmarking tool based on the well-known FurMark software.`n`nUSE AT YOUR OWN RISK!")
	mapApp( occt, "\OCCT\OCCT.exe", 0, "all-in-one stability check & stress test tool. It generates heavy loads on your components while checking for errors, and will detect stability issues faster than anything else. OCCT embeds HWiNFO's monitoring engine (also available on this flash drive) to get precise readings and diagnose issues faster.")
	mapApp( prime95	, "\Prime95\prime95.exe", 0, "Benchmarking/stress testing tool. Fun Fact, The original concept was to slow down CPUs for older programs without speed limiters. Basically just makes your computer try to solve for prime numbers.")
	mapApp( QwikMark, "\QwikMarkPortable\QwikMarkPortable.exe", 0, "Tool which will allow you to see in a matter of seconds the power and performance of your computer.")
		mapApp( superposition, "\unigine\Superposition Benchmark\Superposition.exe", 0, "A lone professor performs dangerous experiments in an abandoned classroom, day in and day out. Obsessed with inventions and discoveries beyond the wildest dreams, he strives to prove his ideas. Once you come to this place in the early morning, you would not meet him there. The eerie thing is a loud bang from the laboratory heard a few moments ago. What was that? You have the only chance to cast some light upon this incident by going deeply into the matter of quantum theory: thorough visual inspection of professor's records and instruments will help to lift the veil on the mystery. `n`n2017")
		mapApp( valley, "\unigine\ValleyBenchmark\valley.bat", 0, "The forest-covered valley surrounded by vast mountains amazes with its scale from a bird’s-eye view and is extremely detailed down to every leaf and flower petal. Valley Benchmark allows you to encounter a morning high up in the mountains when the snow-capped peaks are just barely glittering in the rising sun. Be it flying over the vast green expanses or hiking along rocky slopes, this journey continues as long as you wish. Unique in every corner, this open-space world provides a wonderfully relaxing experience under the tranquil music and sounds of nature. `n`n2013")
		mapApp( heaven, "\unigine\HeavenBenchmark\heaven.bat", 0, "Heaven Benchmark is a GPU-intensive benchmark that hammers graphics cards to the limits. This powerful tool can be effectively used to determine the stability of a GPU under extremely stressful conditions, as well as check the cooling system's potential under maximum heat output. The benchmark immerses a user into a magical steampunk world of shiny brass, wood and gears. Nested on flying islands, a tiny village with its cozy, sun-heated cobblestone streets, and a majestic dragon on the central square gives a true sense of adventure. An interactive experience with fly-by and walk-through modes allows for exploring all corners of this world powered by the cutting-edge UNIGINE Engine that leverages the most advanced capabilities of graphics APIs and turns this bench into a visual masterpiece. `n`n2009")
	
	; Commands
	mapApp( DNR, "\Commands\DNR.bat", 1, "Runs all commands, including a virus scan, on the system drive in the optimal order to fix most issues automatically. This usally takes a while as some commands need to have 2 passes to ensure they complete properly. Will need to reboot at the end to run CHKDSK if needed, script will halt until your ready. If you want to skip a given command, press ctrl+c and select 'N' when asked if you want to terminate the script.")
	mapApp( PCTUNEUP, "\Commands\PCTUNEUP.bat", 1, "Similar to Diag and Repair but no virus scan and only one system repair pass, use this if you know the system is safe but its running slow. Runs DISM, SFC, Defrag, and chkdsk if its needed.")
    mapApp( CHKDSK, "\Commands\CHKDSK.bat", 1, "A command that will scan and repair drives fixing corrupted file system including relocating bad sectors and fixing currupted files on selected drive.")
	mapApp( DEFRAG, "\Commands\DEFRAG.bat", 1, "Uses the built in defrag command to perform the proper optimization for the selected drive. EX: HDD will be defragmented but a SSD will be trimmed.")
	mapApp( DISM, "\Commands\DISM.bat", 1, "An administrator-level, command-line executable available in Windows which can be used to repair your Windows image or to modify Windows installation media. It is able to mount Windows images in .wim, .vhd, or .vhdx format, and can be used to address issues in the currently installed Windows operating system.")
	mapApp( SFC, "\Commands\SFC.bat", 1, "A command that will scan all protected system files, and replace corrupted files with a cached copy that is located in a compressed folder at C:\Windows\System32\dllcache.")
	
	; Installers
	mapApp( Malwarebytes, "\Installers\Malwarebytes.exe", 0, "Downloads and Installs Newest Malwarebytes")
	mapApp( InstallChrome, "\Installers\Chrome.exe", 0, "Downloads and Installs Newest Chrome")
	mapApp( InstallFirefox, "\Installers\Firefox.exe", 0, "Downloads and Installs Newest Firefox")
	mapApp( Essentials, "\Installers\Essentials.exe", 0, "Downloads and Installs: `n`nWinDirStat, 7-Zip, notepad++")
	mapApp( Gaming, "\Installers\Gaming.exe", 0, "Downloads and Installs: `n`n7-Zip, Steam, Discord, WinDirStat")
	mapApp( Editing, "\Installers\Editing.exe", 0, "Downloads and Installs: `n`nqbittorrent, WinDirStat, 7-Zip, VLC, Audacity, Dropbox, Blender, GIMP, .NET Runtime, Handbrake")
	mapApp( Recommended, "\Installers\Recommended.exe", 0, "Downloads and Installs: `n`nFirefox, Chrome, Java, JavaDK, WinDirStat, 7-Zip, Steam, Notepad++, qBittorent, VLC, Audacity, GIMP, .NET Runtime, Handbrake, Eclipse, Malwarebytes`n`n`nThis install pack is bloated because its most of the software I use on my computer.")
	mapApp( Ninite, "\Installers\ninite.bat", 0, "Ninite is a website that enables users to automatically install popular applications for the Windows operating system. It enables users to make a selection from a list of applications and bundles the selection into a single installer package. It is free for personal use.")
	mapApp( Windows10, "\Installers\Windows10MediaCreationTool.exe", 0, "Downloads and Installs Windows 10 using Microsoft's Windows 10 media creation tool.")
	mapApp( Windows11, "\Installers\Windows11InstallationAssistant.exe", 0, "Downloads and Installs Windows 11 using Microsoft's Windows 11 Upgrade Assistant tool.")
	If ( TV_GetSelection() == Other || A_GuiControl == "Other" ) {
		TV_Modify(Other, "Select")
		TV_Modify(Other, "Expand")
		GuiControl, Choose, Tree,% Other
		Gui, Tab,% "Other"
		global lastPath = "\Installers\Other\"
		count := 3
		
		GuiControl, Choose, Tab,% "Other"
		
		; Create the ListView with two columns, Name and Size:
		if (darkMode = true){
			Gui, Add, ListView, x218 y6 w297 h363 gMyListView grid Background454545, Name|Size
			Gui, Add, Text, x415 y+5 w100 h30 Center 0x200 Border gopenLocation, Open File Location
		} else {
			Gui, Add, ListView, x218 y6 w297 h363 gMyListView grid, Name|Size
			Gui, Add, Button, x415 y+5 w100 h30 gopenLocation , Open File Location
		}
		ImageListOther := IL_Create(1,65535)
		LV_SetImageList(ImageListOther)
		IL_Add(ImageListOther, "shell32.dll", 3) ; Fallback Icon
		IL_Add(ImageListOther, "msi.dll", 3) ; MSI icon
		

		LV_ModifyCol(1, 216)  ; Auto-size each column to fit its contents.
		LV_ModifyCol(2, 60)
		LV_ModifyCol(2, "Integer")  ; For sorting purposes, indicate that column 2 is an integer.

		
		
		; Gather a list of file names from a folder and put them into the ListView:
		GuiControl,,readOther, Reading from Disk...
		Loop, %CD%\Portable Software\Installers\Other\*
		{
			if (A_LoopFileExt = "exe") {
				IL_Add(ImageListOther, A_LoopFileLongPath)
				LV_Add("Icon" . count, A_LoopFileName, A_LoopFileSizeMB . " MB")
				count++
			} else if (A_LoopFileExt = "msi") {
				LV_Add("Icon2", A_LoopFileName, A_LoopFileSizeMB . " MB")
			} else {
				LV_Add("Icon1", A_LoopFileName, A_LoopFileSizeMB . " MB")
			}
		}
		SetFormat, float, 6.1
		DriveSpaceFree, FreeSpace, %CD%\
		FreeSpaceGB := (FreeSpace/1024)
		if (FreeSpaceGB < 1) {
			GuiControl,,readOther, %FreeSpace% MB Free
		} else {
			GuiControl,,readOther, %FreeSpaceGB% GB Free
		}
		return

		MyListView:
		if (A_GuiEvent = "DoubleClick")
		{
			LV_GetText(RowText, A_EventInfo)  ; Get the text from the row's first field.
			run %CD%\Portable Software\Installers\Other\%RowText%
		}
		return
		
	}
	If ( TV_GetSelection() == Settings) {
		GuiControl, Choose, Tab,% "Settings"
		TV_Modify(Settings, "Select")
		TV_Modify(Settings, "Expand")
		GuiControl, Choose, Tree,% Settings
		Gui, Tab,% "Settings"
		return
	}
	Return

}


; Fuct
{
	; Add App
	addApp(appName, iconPath, iconID, appParent) {
		GuiControl,Two:,App,%appName%
		perCount++
		percent := floor((perCount/totalApps)*100)
		GuiControl,Two:,Per,%percent%`%
		GuiControl,Two:, MyProgress, %percent%
		iconPath = %iconPath%
		IL_Add(ImageListID, iconPath, iconID)
		appIcon = icon%iconNum%
		iconNum++
		temp := TV_Add(appName, appParent, appIcon)
		TV_GetText(sectionName, appParent)
		GuiControl,,Tab,% appName
		Gui, Tab,% sectionName
		if (appCount > 2 ) {
			if (darkMode = true) { 
				Gui, Add, Text, Center 0x200 Border x%formatX% y+0 w100 h30 gClick, %appName%
			} else {
				Gui, Add, Button, x%formatX% y+0 w100 h30 gClick, %appName%
			}
			appCount := 1
		} else {
			if (darkMode = true) { 
				Gui, Add, Text, x+0 w100 h30 Center 0x200 Border gClick, %appName%
			} else {
				Gui, Add, Button, x+0 w100 h30 gClick, %appName%
			}
			appCount++
		}
		return temp
	}
	
	; Add Sub Section
	addSubSection(appName, iconPath, iconID, appParent) {
		perCount++
		percent := floor((perCount/totalApps)*100)
		GuiControl,Two:,Per,%percent%`%
		GuiControl,Two:, MyProgress, %percent%
		iconPath = %iconPath%
		IL_Add(ImageListID, iconPath, iconID)
		appIcon = icon%iconNum%
		iconNum++
		temp := TV_Add(appName, appParent, appIcon)
		TV_GetText(sectionName, appParent)
		GuiControl,,Tab,% appName
		Gui, Tab,% sectionName
		if (appCount > 2 ) {
			if (darkMode = true) { 
				Gui, Add, Text, Center 0x200 Border x%formatX% y+0 w100 h30 gClick, %appName%
			} else {
				Gui, Add, Button, x%formatX% y+0 w100 h30 gClick, %appName%
			}
			appCount := 1
		} else {
			if (darkMode = true) { 
				Gui, Add, Text, x+0 w100 h30 Center 0x200 Border gClick, %appName%
			} else {
				Gui, Add, Button, x+0 w100 h30 gClick, %appName%
			}
			appCount++
		}
		GuiControl,,Tab,% appName
		Gui, Tab,% appName
		Gui, Add, Text, x%formatX% y+363,
		global appCount := 3
		return temp
	}
	
	; Add Section
	addSection(sectionName, iconPath, iconID) {
		perCount++
		percent := floor((perCount/totalApps)*100)
		GuiControl,Two:,Sec,Loading %sectionName%...
		GuiControl,Two:,Per,%percent%`%
		GuiControl,Two:, MyProgress, %percent%
		iconPath = %iconPath%
		IL_Add(ImageListID, iconPath, iconID)
		appIcon = icon%iconNum%
		iconNum++
		GuiControl,,Tab,% sectionName
		Gui, Tab,% sectionName
		Gui, Add, Text, x%formatX% y+10, %sectionName%:
		global appCount := 3
		return TV_Add(sectionName,, appIcon)
	}
	
	; Add Home
	addHome(sectionName, iconPath, iconID) {
		iconPath = %iconPath%
		IL_Add(ImageListID, iconPath, iconID)
		appIcon = icon%iconNum%
		iconNum++
		GuiControl,,Tab,% sectionName
		Gui, Tab,% sectionName
		Gui, Add, Text, x230 y30 w270, Easy to use app for launching apps installed on this flashdrive. `n`nRight Click on the "Start App" button to force it to run as administrator.
		Gui, Add, GroupBox, x218 y%formatY% w297 h263, %toolboxVersion%
		
		Gui, Add, Text, x%formatX% y+10, Quick Options:
		
		if (darkMode = true) {
			Gui, Add, Text, Center 0x200 Border x%formatX% y+0 w100 h30 grestartRecovery, Boot To Recovery
			Gui, Add, Text, Center 0x200 Border x+0 w100 h30 grestartUEFI, Boot To BIOS
			Gui, Add, Text, Center 0x200 Border x+0 w100 h30 grepair, Repair Toolbox
		} else {
			Gui, Add, Button, x%formatX% y+0 w100 h30 grestartRecovery, Boot To Recovery
			Gui, Add, Button, x+0 w100 h30 grestartUEFI, Boot To BIOS
			Gui, Add, Button, x+0 w100 h30 grepair, Repair Toolbox
		}
		
		Gui, Add, Text, x%formatX% y+10, Click on a section below to jump to it:
		
		if (darkMode = true) {
			Gui, Add, Text, Center 0x200 Border x%formatX% y+0 w100 h30 gClick, Utilities
			Gui, Add, Text, Center 0x200 Border x+0 w100 h30 gClick, Diagnostic
			Gui, Add, Text, Center 0x200 Border x+0 w100 h30 gClick, System Info
			Gui, Add, Text, Center 0x200 Border x%formatX% y+0 w100 h30 gClick, Benchmark
			Gui, Add, Text, Center 0x200 Border x+0 w100 h30 gClick, Commands
			Gui, Add, Text, Center 0x200 Border x+0 w100 h30 gClick, Installers
		} else {
			Gui, Add, Button, x%formatX% y+0 w100 h30 gClick, Utilities
			Gui, Add, Button, x+0 w100 h30 gClick, Diagnostic
			Gui, Add, Button, x+0 w100 h30 gClick, System Info
			Gui, Add, Button, x%formatX% y+0 w100 h30 gClick, Benchmark
			Gui, Add, Button, x+0 w100 h30 gClick, Commands
			Gui, Add, Button, x+0 w100 h30 gClick, Installers
		}
		global appCount := 3
		return TV_Add(sectionName,, appIcon)
		
		restartUEFI:
			Run *RunAs %CD%\Portable Software\Home\restertUEFI.bat
		return
		
		restartRecovery:
			Run %CD%\Portable Software\Home\restartRecvoery.bat
		return
		
		repair: 
			Run %CD%\Portable Software\Home\repair.bat
		return
	}

	; Map Section
	mapSection(sectionID) {
		TV_GetText(sectionName, sectionID)
		If ( TV_GetSelection() == sectionID || A_GuiControl == sectionName ) {
			GuiControl, Choose, Tab,% sectionName
			TV_Modify(sectionID, "Expand")
			TV_Modify(sectionID, "Select")
		}
	}
	
	; Map Sub Section
	mapSubSection(subSectionID, boarderHeight, subSectionDesc) {
		TV_GetText(subSectionName, subSectionID)
		If ( TV_GetSelection() == subSectionID || A_GuiControl == subSectionName ) {
			GuiControl, Choose, Tab,% subSectionName
			TV_Modify(subSectionID, "Expand")
			TV_Modify(subSectionID, "Select")
			Gui, Tab,% subSectionName
			Gui, Add, GroupBox, x218 y%formatY% w297 h%boarderHeight%, %subSectionName%
			Gui, Add, Text, x230 y30 w270, %subSectionDesc%
		}
	}
	
	; Map App
	mapApp(appID, appPath, elevated, appDesc) {
		TV_GetText(appName, appID)
		If ( TV_GetSelection() == appID || A_GuiControl == appName ) {
			global lastPath = appPath
			TV_Modify(appID, "Select")
			GuiControl, Choose, Tree,% appID
			Gui, Tab,% appName
		    Gui, Add, GroupBox, x218 y%formatY% w297 h364, %appName%
			if (darkMode = true) {
				Gui, Add, Text, Center 0x200 Border x315 y+5 w100 h30 gopenLocation, Open File Location
			} else {
				Gui, Add, Button, x315 y+5 w100 h30 gopenLocation, Open File Location
			}
			if (elevated = 1) {
				if (darkMode = true) {
					Gui, Add, Text, Center 0x200 Border x+0 w100 h30 gstartAppElevated, Start App
				} else {
					Gui, Add, Button, x+0 w100 h30 gstartAppElevated, Start App
				}
			} else {
				if (darkMode = true) {
					Gui, Add, Text, Center 0x200 Border x+0 w100 h30 gstartApp, Start App
				} else {
					Gui, Add, Button, x+0 w100 h30 gstartApp, Start App
				}
			}
			Gui, Add, Text, x230 y30 w270, %appDesc%
			GuiControl, Choose, Tab,% appName
			return
		}
	}
	
	;Add Settings
	addSettings(sectionName, iconPath, iconID) {
		perCount++
		percent := floor((perCount/totalApps)*100)
		GuiControl,Two:,Sec,Loading %sectionName%...
		GuiControl,Two:,Per,%percent%`%
		GuiControl,Two:, MyProgress, %percent%
		iconPath = %iconPath%
		IL_Add(ImageListID, iconPath, iconID)
		appIcon = icon%iconNum%
		iconNum++
		GuiControl,,Tab,% sectionName
		Gui, Tab,% sectionName
		FormatTime, Year,,yyyy
		
		Gui, Add, GroupBox, x218 y%formatY% w297 h364, Settings
		
		if (darkMode = true) {
			Gui, Add, Text, Center 0x200 Border x415 y+5 w100 h30 gsettingApply, Reload
		} else {
			Gui, Add, Button, x415 y+5 w100 h30 gsettingApply, Reload
		}
		
		if (darkMode = true) {
			Gui, Add, CheckBox, x230 y30 Checked gsettingDarkMode, Dark Mode (Requires Reload)
		} else {
			Gui, Add, CheckBox, x230 y30 gsettingDarkMode, Dark Mode (Requires Reload)
		}
		Gui, Add, Text, x250 y+5 w250, Tired of having your eyes burned out do to those flashbangs disguised as programs? This setting enables a dark mode window style.
		
		if (9XMode = true) {
			Gui, Add, CheckBox, x230 y+10  Checked gsettingWin9x, Windows 9X Mode (Requires Reload)
			Gui, Add, Text, x250 y+5 w250,Gives the program a nostalgic look. Runs better on slower computers.
		} else {
			Gui, Add, CheckBox, x230 y+10 gsettingWin9x, Windows 9X Mode (Requires Reload)
			Gui, Add, Text, x250 y+5 w250,Gives the program a nostalgic look. Runs better on slower computers.
		}
		 
		
		if (onTop = true) {
			Gui, Add, CheckBox, x230 y+10 Checked gonTop, Always On Top (Requires Reload)
		} else {
			Gui, Add, CheckBox, x230 y+10 gonTop, Always On Top (Requires Reload)
		}
		Gui, Add, Text, x250 y+5 w250,Makes the window always render on top. Useful for fixing computers with popups.
		
		if (ghostMode = true) {
			Gui, Add, CheckBox, x230 y+10 Checked gsettingGhostModeEnable, Ghost Mode (Beta)
			if (ghostModeAlways = true) {
				Gui, Add, CheckBox, x+10 Checked gsettingGhostModeAlways, Always On
			} else {
				Gui, Add, CheckBox, x+10 gsettingGhostModeAlways, Always On
			}
		} else {
			Gui, Add, CheckBox, x230 y+10 gsettingGhostModeEnable, Ghost Mode (Beta)
			if (ghostModeAlways = true) {
				Gui, Add, CheckBox, x+10 Checked gsettingGhostModeAlways, Always On
			} else {
				Gui, Add, CheckBox, x+10 gsettingGhostModeAlways, Always On
			}
		}
		Gui, Add, Slider, x230 y+5 w275 TickInterval255 gsettingGhostMode vbrightness Range32-255, %brightness%
		Gui, Add, Text, x250 y+0 w255,Makes the window transparent when it loses focus. Always on makes it always transparent.
		
		Gui, Add, Text, x230 y+10 w250, Bumpscosity:
		Gui, Add, Slider, x230 y+5 w275 TickInterval500 vbumpscosity Range-0-1000 ToolTipRight gsettingBumpscosity, %bumpscosity%
		Gui, Add, Text, x250 y+0 w250,Changes the Bumpscosity level of the program.
		global appCount := 3
		return TV_Add(sectionName,, appIcon)
	}
	
}

focus:
	IfWinActive, Toolbox 
	{
		if (focusYes = 0) {
			WinSet, Transparent, 255, Toolbox
			focusYes = 1
		}
		return
	}
	IfWinNotActive, Toolbox 
	{
		if (focusYes = 1) {
			WinSet, Transparent, %brightness%, Toolbox
			focusYes = 0
		}
		return
	}
return


; Setting code

settingApply:
	if (onTopBoot = true) {
		MsgBox, 4100, Settings, Settings will apply on next launch. `nWould you like to restart Toolbox now?
	} else {
		MsgBox, 4, Settings, Settings will apply on next launch. `nWould you like to restart Toolbox now?
	}
	IfMsgBox Yes
	Reload
return
return

settingDarkMode:
	if (darkMode = false) {
		GuiControl,,readSettings, Writing to Disk...
		FileAppend,, %CD%\Portable Software\darkMode
		darkMode := true
		GuiControl,,readSettings, 
	} else {
		GuiControl,,readSettings, Writing to Disk...
		FileDelete, %CD%\Portable Software\darkMode
		darkMode := false
		GuiControl,,readSettings, 
	}
return
		
settingWin9x:
	if (9XMode = false) {
		GuiControl,,readSettings, Writing to Disk...
		FileAppend,, %CD%\Portable Software\98iscool
		9XMode := true
		GuiControl,,readSettings, 
	} else {
		
		GuiControl,,readSettings, Writing to Disk...
		FileDelete, %CD%\Portable Software\98iscool
		9XMode := false
		GuiControl,,readSettings, 
	}
return

onTop:
	if (onTop = false) {
		GuiControl,,readSettings, Writing to Disk...
		FileAppend,, %CD%\Portable Software\onTop
		onTop := true
		GuiControl,,readSettings, 
	} else {
		GuiControl,,readSettings, Writing to Disk...
		FileDelete, %CD%\Portable Software\onTop
		onTop := false
		GuiControl,,readSettings, 
	}
return

settingGhostModeEnable:
	if (ghostMode = false) {
		GuiControl,,readSettings, Writing to Disk...
		FileAppend,, %CD%\Portable Software\ghostMode
		FileDelete, %CD%\Portable Software\ghostModeData
		FileAppend, %brightness%, %CD%\Portable Software\ghostModeData 
		if (ghostModeAlways = true) {
			WinSet, Transparent, %brightness%, Toolbox
		} else {
			SetTimer,focus,100
		}
		ghostMode := true
		GuiControl,,readSettings, 
	} else {
		GuiControl,,readSettings, Writing to Disk...
		FileDelete, %CD%\Portable Software\ghostMode
		WinSet, Transparent, 255, Toolbox
		SetTimer, focus, OFF
		ghostMode := false
		GuiControl,,readSettings, 
	}
return

settingGhostModeAlways:
	if (ghostModeAlways = false) {
		GuiControl,,readSettings, Writing to Disk...
		FileAppend,, %CD%\Portable Software\ghostModeAlways
		if (ghostMode = true) {
			WinSet, Transparent, %brightness%, Toolbox
			SetTimer, focus, OFF
		}
		ghostModeAlways := true
		GuiControl,,readSettings,
	} else {
		GuiControl,,readSettings, Writing to Disk...
		FileDelete, %CD%\Portable Software\ghostModeAlways
		if (ghostMode = true) {
			WinSet, Transparent, 255, Toolbox
			SetTimer,focus,100
		}
		ghostModeAlways := false
		GuiControl,,readSettings, 
	}
return

settingGhostMode:
	
	GuiControl,,readSettings, Writing to Disk...
	FileDelete, %CD%\Portable Software\ghostModeData
	FileAppend, %brightness%, %CD%\Portable Software\ghostModeData
	if (ghostMode = true) {
		if (ghostModeAlways = true) {
			WinSet, Transparent, %brightness%, Toolbox
		}
	}
	GuiControl,,readSettings, 
return

settingBumpscosity:
	GuiControl,,readSettings, Initiating bumpscosity driver...
	
	FileDelete, %CD%\Portable Software\Bumpscosity
	FileAppend, %bumpscosity%, %CD%\Portable Software\Bumpscosity
	
	sleep 1000
	GuiControl,,setBumpscosity, %bumpscosity%
	if (bumpscosity = 1000) {
		GuiControl,,readSettings, Bumpscosity Overload!
	} else if (bumpscosity = 666) {
		GuiControl,,readSettings, Your Let them out...
		Gui, Color,880000
		MsgBox,  48, What did you do, Your Let them out...
		FileDelete, %CD%\Portable Software\Bumpscosity
		FileAppend, 500, %CD%\Portable Software\Bumpscosity
		sleep 5000
		MsgBox,  16, Critical Error, Error: (34)`nRogue child proccess has accessed protected system memory.
		ExitApp
	} else if (bumpscosity = 621) {
		GuiControl,,readSettings, Monosodium Glutamate OwO
	} else if (bumpscosity = 427) {
		GuiControl,,readSettings, Employee #427
	} else if (bumpscosity = 420) {
		GuiControl,,readSettings, Blaze it!
	} else if (bumpscosity = 87) {
		GuiControl,,readSettings, IS THAT THE BITE OF 87!
	} else if (bumpscosity = 69) {
		GuiControl,,readSettings, Nice.
	} else if (bumpscosity = 47) {
		GuiControl,,readSettings, Names Are For Friends,`nSo I Don't Need One.
	} else if (bumpscosity = 21) {
		GuiControl,,readSettings, What's 9+10
	} else if (bumpscosity = 0) {
		GuiControl,,readSettings, Bumpscosity Crash!
	} else {
		GuiControl,,readSettings, Bumpscosity Set!
	}
	
	sleep 1000
	GuiControl,,readSettings, 
return




GuiContextMenu:
If ( A_GuiControl == "Start App" ) {
	goto startAppElevated
}
return
startApp:
	Run %CD%\Portable Software\%lastPath%
return
startAppElevated:
	Run *RunAs %CD%\Portable Software\%lastPath%
return
openLocation:
	Stringlen, pathLength, lastPath
	lastSlash := InStr(lastPath, "\", false, -0)
	trueLength := pathLength - lastSlash
	StringTrimRight, trimmedPath, lastPath, trueLength
	Run explorer %CD%\Portable Software%trimmedPath%
return
