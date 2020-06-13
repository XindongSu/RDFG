program RDFG;

uses
  Forms, Interfaces,
  UnitFormRDFG in 'UnitFormRDFG.pas' {FormRDFG};

{$R *.res}

begin
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TFormRDFG, FormRDFG);
  Application.Run;
end.
