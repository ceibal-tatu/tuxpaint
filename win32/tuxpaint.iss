;
; This script needs the InnoSetup PreProcessor (ISPP) to compile correctly. 
; I downloaded a combined 'QuickStart Pack' from here:
; http://www.jrsoftware.org/isdl.php#qsp
;
; The version string is extracted from the executable.
;

#define PublisherName "New Breed Software"
#define PublisherURL  "{code:MyPublisherURL}"

#define AppName       "Tux Paint"
#define AppDirName    "TuxPaint"
#define AppPrefix     "tuxpaint"
#define AppRegKey     AppDirName
#define AppRegValue   "Install_Dir"
#define AppRegVersion "Version"

#define AppGroupName  AppName
#define AppExe        AppPrefix+".exe"
#define AppConfigName AppName+" Config"
#define AppConfigExe  AppPrefix+"-config.exe"
#define AppReadme     "{code:MyReadme}"
#define AppLicence    "{code:MyLicence}"

#define BdistDir      ".\bdist"
#define AppVersion    GetStringFileInfo(BdistDir+"\"+AppExe, "FileVersion")

[Setup]
AppName={#AppName}
AppVerName={#AppName} {#AppVersion}
AppPublisher={#PublisherName}
AppPublisherURL={#PublisherURL}
AppSupportURL={#PublisherURL}
AppUpdatesURL={#PublisherURL}
DefaultDirName={pf}\{#AppDirName}
DefaultGroupName={#AppGroupName}
LicenseFile={#BdistDir}\docs\COPYING.txt
OutputDir=.\
OutputBaseFilename={#AppPrefix}-{#AppVersion}-win32-installer
SetupIconFile={#BdistDir}\data\images\tuxpaint-installer.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "eng"; MessagesFile: "compiler:Default.isl"
Name: "bra"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"; LicenseFile: {#BdistDir}\docs\pt_br\COPYING_pt_BR.txt;
Name: "cat"; MessagesFile: "compiler:Languages\Catalan.isl"; LicenseFile: {#BdistDir}\docs\ca\COPYING.txt;
Name: "cze"; MessagesFile: "compiler:Languages\Czech.isl"; LicenseFile: {#BdistDir}\docs\cs\COPYING.txt;
Name: "dan"; MessagesFile: "compiler:Languages\Danish.isl"; LicenseFile: {#BdistDir}\docs\da\COPYING.txt;
Name: "dut"; MessagesFile: "compiler:Languages\Dutch.isl"; LicenseFile: {#BdistDir}\docs\nl\COPYING_nl.txt;
Name: "fre"; MessagesFile: "compiler:Languages\French.isl"; LicenseFile: {#BdistDir}\docs\fr\COPIER.txt;
Name: "ger"; MessagesFile: "compiler:Languages\German.isl"; LicenseFile: {#BdistDir}\docs\de\KOPIE.txt;
Name: "hun"; MessagesFile: "compiler:Languages\Hungarian.isl"
Name: "ita"; MessagesFile: "compiler:Languages\Italian.isl"; LicenseFile: {#BdistDir}\docs\it\COPIATURA.txt;
Name: "nor"; MessagesFile: "compiler:Languages\Norwegian.isl"
Name: "pol"; MessagesFile: "compiler:Languages\Polish.isl"; LicenseFile: {#BdistDir}\docs\pl\LICENCJA-GNU.txt;
Name: "por"; MessagesFile: "compiler:Languages\Portuguese.isl"
Name: "rus"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "slo"; MessagesFile: "compiler:Languages\Slovenian.isl"
Name: "esp"; MessagesFile: "compiler:Languages\Spanish.isl"; LicenseFile: {#BdistDir}\docs\es\COPIADO.txt;

; Additional, Candidate official translations
Name: "chs"; MessagesFile: "compiler:Languages\ChineseSimp-12-5.1.11.isl"

; Additional, Unofficial translations
Name: "gal"; MessagesFile: "compiler:Languages\Galician-2-5.1.11.isl"
Name: "cht"; MessagesFile: "compiler:Languages\ChineseTrad-2-5.1.11.isl"
Name: "jpn"; MessagesFile: "compiler:Languages\Japanese-5-5.1.11.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";

[Files]
Source: "{#BdistDir}\*.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BdistDir}\*.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BdistDir}\data\*"; DestDir: "{app}\data"; Excludes: "CVS"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#BdistDir}\docs\*"; DestDir: "{app}\docs"; Excludes: "CVS,Makefile,*~"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#BdistDir}\etc\*"; DestDir: "{app}\etc"; Flags: skipifsourcedoesntexist ignoreversion recursesubdirs createallsubdirs
Source: "{#BdistDir}\lib\*"; DestDir: "{app}\lib"; Flags: skipifsourcedoesntexist ignoreversion recursesubdirs createallsubdirs
Source: "{#BdistDir}\im\*"; DestDir: "{app}\im"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#BdistDir}\plugins\*"; DestDir: "{app}\plugins"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#BdistDir}\locale\*"; DestDir: "{app}\locale"; Excludes: "CVS"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#BdistDir}\..\libdocs\*"; DestDir: "{app}\docs\libdocs"; Excludes: "CVS,Makefile,*~"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[INI]
Filename: "{code:MyGroupDir}\{groupname}\{cm:ProgramOnTheWeb,{#AppName}}.url"; Section: "InternetShortcut"; Key: "URL"; String: "{#PublisherURL}"

[Icons]
Name: "{code:MyGroupDir}\{groupname}\Configure {#AppName}"; Filename: "{app}\{#AppConfigExe}"; Comment: "{#AppConfigName}"
Name: "{code:MyGroupDir}\{groupname}\{#AppName} (Full Screen)"; Filename: "{app}\{#AppExe}"; Parameters: "--fullscreen"; Comment: "Start {#AppName} in Fullscreen mode"
Name: "{code:MyGroupDir}\{groupname}\{#AppName} (Windowed)"; Filename: "{app}\{#AppExe}"; Parameters: "--windowed"; Comment: "Start {#AppName} in a Window"
Name: "{code:MyGroupDir}\{groupname}\Readme"; Filename: "{app}\{#AppReadme}"; Comment: "View ReadMe"
Name: "{code:MyGroupDir}\{groupname}\Licence"; Filename: "{app}\{#AppLicence}"; Comment: "View License"
Name: "{code:MyGroupDir}\{groupname}\{cm:UninstallProgram,{#AppName}}"; Filename: "{uninstallexe}"; IconFilename: "{app}\data\images\tuxpaint-installer.ico"; Comment: "Remove {#AppName}"
Name: "{code:MyDesktopDir}\{#AppName}"; Filename: "{app}\{#AppExe}"; Tasks: desktopicon

[Registry]
Root: HKLM; Subkey: "SOFTWARE\{#AppRegKey}"; Flags: uninsdeletekey; ValueName: "{#AppRegValue}"; ValueType: string; ValueData: "{app}"; Check: AllUsers;
Root: HKCU; Subkey: "SOFTWARE\{#AppRegKey}"; Flags: uninsdeletekey; ValueName: "{#AppRegValue}"; ValueType: string; ValueData: "{app}"; Check: ThisUserOnly;
Root: HKLM; Subkey: "SOFTWARE\{#AppRegKey}"; Flags: uninsdeletekey; ValueName: "{#AppRegVersion}"; ValueType: string; ValueData: "{#AppVersion}"; Check: AllUsers;
Root: HKCU; Subkey: "SOFTWARE\{#AppRegKey}"; Flags: uninsdeletekey; ValueName: "{#AppRegVersion}"; ValueType: string; ValueData: "{#AppVersion}"; Check: ThisUserOnly;

[Run]
Filename: "{app}\{#AppReadme}"; Description: "View the README file"; Flags: postinstall shellexec skipifsilent
Filename: "{app}\{#AppConfigExe}"; Description: "{cm:LaunchProgram,{#AppConfigName}}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: files; Name: "{code:MyGroupDir}\{groupname}\{cm:ProgramOnTheWeb,{#AppName}}.url"

[code]
const
  CSIDL_PROFILE = $0028;
  CSIDL_COMMON_PROGRAMS = $0017;
  CSIDL_COMMON_DESKTOPDIRECTORY = $0019;
var
  InstallTypePageID: Integer;
  CheckListBox2: TNewCheckListBox;

function Restricted(): Boolean;
begin
  Result := not (IsAdminLoggedOn() or IsPowerUserLoggedOn())
end;

function NotRestricted(): Boolean;
begin
  Result := not Restricted()
end;

function Is9xME(): Boolean;
begin
  Result := not UsingWinNT()
end;

function CurrentUserOnly(): Boolean;
begin
  Result := CheckListBox2.Checked[2]
end;

function ThisUserOnly(): Boolean;
begin
  Result := (Restricted() or CurrentUserOnly()) and UsingWinNT()
end;

function AllUsers(): Boolean;
begin
  Result := not ThisUserOnly()
end;

function MyAppDir(): String;
var
  Path: String;
begin
  Path := ExpandConstant('{reg:HKLM\SOFTWARE\{#AppRegKey},{#AppRegValue}|{pf}\{#AppDirName}}');
  if ThisUserOnly() then
  begin
    Path := ExpandConstant('{reg:HKCU\SOFTWARE\{#AppRegKey},{#AppRegValue}|__MissingKey__}');
    if Path = '__MissingKey__' then
    begin
      Path := GetShellFolderByCSIDL(CSIDL_PROFILE, True);
      if Path = '' then
        Path := RemoveBackslashUnlessRoot(ExtractFilePath(ExpandConstant('{userdocs}')));
      Path := Path + '\Programs\{#AppDirName}'
    end
  end
  Result := Path
end;

function MyGroupDir(Default: String): String;
var
  Path: String;
begin
  if ThisUserOnly() then
    Path := ExpandConstant('{userprograms}')
  else
    Path := ExpandConstant('{commonprograms}')
  Result := Path
end;

function MyDesktopDir(Default: String): String;
var
  Path: String;
begin
  if ThisUserOnly() then
    Path := ExpandConstant('{userdesktop}')
  else
    Path := ExpandConstant('{commondesktop}')
  Result := Path
end;

procedure CreateTheWizardPages;
var
  Page: TWizardPage;
  Enabled, InstallAllUsers: Boolean;
begin
  Page := CreateCustomPage(wpLicense, 'Choose Installation Type', 'Who do you want to be able to use this program?');
  InstallTypePageID := Page.ID;
  Enabled := NotRestricted();
  InstallAllUsers := NotRestricted();
  CheckListBox2 := TNewCheckListBox.Create(Page);
  CheckListBox2.Width := Page.SurfaceWidth;
  CheckListBox2.Height := ScaleY(97);
  CheckListBox2.BorderStyle := bsNone;
  CheckListBox2.ParentColor := True;
  CheckListBox2.MinItemHeight := WizardForm.TasksList.MinItemHeight;
  CheckListBox2.ShowLines := False;
  CheckListBox2.WantTabs := True;
  CheckListBox2.Parent := Page.Surface;
  CheckListBox2.AddGroup('Installation Type:', '', 0, nil);
  CheckListBox2.AddRadioButton('All Users', '', 0, InstallAllUsers, Enabled, nil);
  CheckListBox2.AddRadioButton('Current User Only', '', 0, not InstallAllUsers, True, nil);
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpSelectDir then
  begin
    WizardForm.DirEdit.Text := MyAppDir();
  end
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  Result := (PageID = InstallTypePageID) and Is9xME();
end;

procedure InitializeWizard();
begin
  CreateTheWizardPages;
end;

function Lang2Gettext(): String;
var
  lang, lc: String;
begin
  lang := ActiveLanguage();

  if lang = 'bra' then
    lc := 'pt_br'
  else
  if lang = 'cat' then
    lc := 'ca'
  else
  if lang = 'cze' then
    lc := 'cs'
  else
  if lang = 'dan' then
    lc := 'da'
  else
  if lang = 'dut' then
    lc := 'nl'
  else
  if lang = 'fre' then
    lc := 'fr'
  else
  if lang = 'ger' then
    lc := 'de'
  else
  if lang = 'hun' then
    lc := 'hu'
  else
  if lang = 'ita' then
    lc := 'it'
  else
  if lang = 'nor' then
    lc := 'nn'
  else
  if lang = 'pol' then
    lc := 'pl'
  else
  if lang = 'por' then
    lc := 'pt'
  else
  if lang = 'rus' then
    lc := 'ru'
  else
  if lang = 'slo' then
    lc := 'sk'
  else
  if lang = 'chs' then
    lc := 'zh_cn'
  else
  if lang = 'esp' then
    lc := 'es'
  else
  if lang = 'gal' then
    lc := 'gl'
  else
  if lang = 'cht' then
    lc := 'zh_tw'
  else
    lc := 'en'
  Result := lc
end;

function MyReadme(Default: String): String;
var
  lang, readme: String;
begin
  lang := Lang2Gettext();

  if lang = 'nl' then
    readme := 'nl\html\README.html'
  else
  if lang = 'fr' then
    readme := 'fr\html\README1.html'
  else
  if lang = 'it' then
    readme := 'it\html\README.html'
  else
  if lang = 'es' then
    readme := 'es\html\LEEME.html'
  else
  if lang = 'gl' then
    readme := 'gl\html\README.html'
  else
  if lang = 'zh_tw' then
    readme := 'zh_tw\html\README.html'
  else
    readme := 'html\README.html'

  Result := 'docs\'+readme
end;

function MyLicence(Default: String): String;
var
  lang, licence: String;
begin
  lang := Lang2Gettext();

  if lang = 'pt_br' then
    licence := 'pt_br\COPYING_pt_BR.txt'
  else
  if lang = 'ca' then
    licence := 'ca\COPYING.txt'
  else
  if lang = 'cs' then
    licence := 'cs\COPYING.txt'
  else
  if lang = 'da' then
    licence := 'da\COPYING.txt'
  else
  if lang = 'nl' then
    licence := 'nl\COPYING_nl.txt'
  else
  if lang = 'fr' then
    licence := 'fr\COPIER.txt'
  else
  if lang = 'de' then
    licence := 'de\KOPIE.txt'
  else
  if lang = 'it' then
    licence := 'it\COPIATURA.txt'
  else
  if lang = 'pl' then
    licence := 'pl\LICENCJA-GNU.txt'
  else
  if lang = 'es' then
    licence := 'es\COPIADO.txt'
  else
    licence := 'COPYING.txt'

  Result := 'docs\'+licence
end;

function MyPublisherURL(Default: String): String;
var
  lang: String;
begin
  lang := Lang2Gettext();

  if lang = 'chs' then
    lang := 'zh-cn'
  else
  if lang = 'cht' then
    lang := 'zh-tw'

  Result := 'http://www.tuxpaint.org/?lang='+lang
end;

#expr SaveToFile(AddBackslash(SourcePath) + 'Preprocessed.iss')

