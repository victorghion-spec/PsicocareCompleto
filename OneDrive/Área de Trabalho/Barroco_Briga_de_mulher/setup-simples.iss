[Setup]
AppId={{A1B2C3D4-E5F6-7890-ABCD-EF1234567890}
AppName=Oratória Feminina
AppVersion=1.0.0
AppPublisher=Oratória Feminina
DefaultDirName={autopf}\Oratoria Feminina
DefaultGroupName=Oratória Feminina
OutputDir=dist
OutputBaseFilename=OratoriaFeminina-Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=lowest

[Languages]
Name: "portuguese"; MessagesFile: "compiler:Languages\Portuguese.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Criar atalho na área de trabalho"; GroupDescription: "Atalhos"; Flags: unchecked

[Files]
Source: "index.html"; DestDir: "{app}"; Flags: ignoreversion
Source: "game.js"; DestDir: "{app}"; Flags: ignoreversion
Source: "style.css"; DestDir: "{app}"; Flags: ignoreversion
Source: "manifest.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "service-worker.js"; DestDir: "{app}"; Flags: ignoreversion
Source: "iniciar-jogo.bat"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\Oratória Feminina"; Filename: "{app}\iniciar-jogo.bat"; WorkingDir: "{app}"
Name: "{group}\Desinstalar Oratória Feminina"; Filename: "{uninstallexe}"
Name: "{autodesktop}\Oratória Feminina"; Filename: "{app}\iniciar-jogo.bat"; Tasks: desktopicon; WorkingDir: "{app}"

[Run]
Filename: "{app}\iniciar-jogo.bat"; Description: "Iniciar Oratória Feminina"; Flags: nowait postinstall skipifsilent shellexec

