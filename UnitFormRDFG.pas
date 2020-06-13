unit UnitFormRDFG;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type

  { TFormRDFG }

  TFormRDFG = class(TForm)
    Label4: TLabel;
    PageControl1: TPageControl;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    RadioGroup1: TRadioGroup;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    RadioGroup2: TRadioGroup;
    Edit3: TEdit;
    Edit4: TEdit;
    RadioGroup3: TRadioGroup;
    Edit5: TEdit;
    Label3: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
  private
    UserCancel: boolean;
    function GenerateOneFile(aFileLength: Int64; aFileNumber: Integer): boolean;
    function ValidateHex(aHexString: string): boolean;
  public
    { Public declarations }
  end;

var
  FormRDFG: TFormRDFG;

implementation

{$R *.dfm}

const
  cnMaxBufferLength = 4096;
  cnMaxBufferPosition = cnMaxBufferLength-1;

procedure TFormRDFG.RadioGroup1Click(Sender: TObject);
var
  mb: Int64;
begin
  case RadioGroup2.ItemIndex of
  0: mb := 1;
  1: mb := 1024;
  2: mb := 1024*1024;
  else
    mb := 1;
  end;

  Edit1.Text := IntToStr(mb * StrToInt(RadioGroup1.Items[RadioGroup1.ItemIndex]));
end;

procedure TFormRDFG.Button1Click(Sender: TObject);
begin
  if SelectDirectoryDialog1.Execute then
    Edit4.Text := SelectDirectoryDialog1.FileName;
end;

procedure TFormRDFG.Button2Click(Sender: TObject);
var
  FileLength: Int64;
  i, FileCount: Integer;
begin
  UserCancel := false;
  Button2.Enabled := false;
  FileLength := StrToIntDef(Edit1.Text, 0);
  if FileLength = 0 then
  begin
    ShowMessage('无效的数据长度！');
    exit;
  end;
  FileCount := StrToIntDef(Edit3.Text, 0);
  ProgressBar2.Position := 0;
  ProgressBar2.Max := FileCount;
  Randomize;
  for i := 1 to FileCount do
  begin
    ProgressBar2.StepBy(1);
    if not GenerateOneFile(FileLength, i) then
    begin
      ShowMessage('生成文件过程出错！');
      exit;
    end;
  end;
  Button2.Enabled := true;
end;

procedure TFormRDFG.Button3Click(Sender: TObject);
begin
  UserCancel := true;
end;

function TFormRDFG.GenerateOneFile(aFileLength: Int64; aFileNumber: Integer): boolean;
var
  i: Int64;
  DataFile: file;
  Buffer: packed array [0..cnMaxBufferPosition] of byte;
  WriteLength: integer;
  LastPercent: integer;
  Filled: Boolean;
  MethodIndex: Integer;

  procedure FillBufferWithSpecifiedValue(aValue: Integer);
  var
    v: Byte;
    j: integer;
  begin
    v := Byte(aValue);
    for j := 0 to cnMaxBufferPosition do
      Buffer[j] := Byte(v);
  end;

  procedure FillBufferWithRandomValue;
  var
    j: integer;
    LastRandom: byte;
    CurrentValue: byte;
  begin
    LastRandom := 0;
    for j := 0 to cnMaxBufferPosition do
    begin
      repeat
        CurrentValue := Byte(Random(256));
      until CurrentValue <> LastRandom; // to make sure there will be no continuous number.
      Buffer[j] := CurrentValue;
      LastRandom := CurrentValue;
    end;
  end;

  function FillBuffer: boolean;
  begin
    Result := false;

    case MethodIndex of
    0:
      begin
        FillBufferWithRandomValue;
        Filled := false; // Buffer must be refresh for fully random.
      end;
    1, 2, 3, 4:
      begin
        FillBufferWithSpecifiedValue(StrToInt(RadioGroup3.Items[MethodIndex]));
        Filled := true;
      end;
    5:
      begin
        if not ValidateHex(Edit5.Text) then
        begin
          ShowMessage('自定义内容不是有效的2位16进制数值！');
          exit;
        end;
        FillBufferWithSpecifiedValue(StrToInt('$'+Trim(Edit5.Text)));
        Filled := true;
      end;
    else
      exit;
    end;

    Result := true;
  end;

begin
  MethodIndex := RadioGroup3.ItemIndex;
  Filled := False;
  LastPercent := 0;
  ProgressBar1.Position := 0;
  AssignFile(DataFile, IncludeTrailingPathDelimiter(Edit4.Text)+Edit2.Text+IntToStr(aFileNumber)+'.dat');
  ReWrite(DataFile, 1);
  i := 0;
  while i < aFileLength do
  begin
    if not Filled then
      if not FillBuffer then
        break;

    WriteLength := cnMaxBufferLength;
    if aFileLength - i < WriteLength then
      WriteLength := aFileLength - i;
    BlockWrite(DataFile, Buffer, WriteLength);
    Inc(i, WriteLength);
    if LastPercent <> round(i/aFileLength*100) then
    begin
      LastPercent := round(i/aFileLength*100);
      ProgressBar1.Position := LastPercent;
      Application.ProcessMessages;
      if UserCancel then
        break;
    end;
  end;
  CloseFile(DataFile);
  Result := true;
end;

procedure TFormRDFG.FormShow(Sender: TObject);
begin
RadioGroup1Click(Sender);
end;

procedure TFormRDFG.RadioGroup3Click(Sender: TObject);
begin
  Edit5.Enabled := RadioGroup3.ItemIndex = 5;
end;

function TFormRDFG.ValidateHex(aHexString: string): boolean;

  function CharIsHexDigit(aChar: Char): boolean;
  var
    v: Integer;
  begin
    v := Integer(aChar);
    if (v >= 48) and (v <= 57) then
      Result := true
    else
    if (v >= 65) and (v <= 90) then
      Result := true
    else
    if (v >= 97) and (v <= 122) then
      Result := true
    else
      Result := false;
  end;

var
  s: string;
begin
  Result := true;
  s := Trim(aHexString);
  if Length(s) = 1 then
    Result := CharIsHexDigit(s[1])
  else if Length(s) = 2 then
    Result := CharIsHexDigit(s[1]) and CharIsHexDigit(s[2])
  else if Length(s) <> 0 then
    Result := False;
end;

procedure TFormRDFG.Edit5Change(Sender: TObject);
begin
  if not ValidateHex(Edit5.Text) then
    Label9.Caption := '输入的内容不是有效的2位16进制数。'
  else
    Label9.Caption := '';
end;

end.
