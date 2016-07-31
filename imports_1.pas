unit imports_1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, PngBitBtn, DBCtrlsEh, Vcl.Mask, SynEdit, SynMemo, MemTableDataEh, MemTableEh;

type
  Tfimports_1 = class(TForm)
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    oQry_Ctas: TFDQuery;
    oDs_Ctas: TDataSource;
    oGrid_Lst: TDBGridEh;
    oBtnExit: TPngBitBtn;
    oDBNav: TDBNavigator;
    TabSheet2: TTabSheet;
    oBtn_Save: TPngBitBtn;
    oTxtFile: TSynMemo;
    Label6: TLabel;
    oFecha_Busq: TDBDateTimeEditEh;
    oBtn_Doit: TPngBitBtn;
    oBtnEdit: TPngBitBtn;
    oLst_tipo: TComboBox;
    Label1: TLabel;
    procedure oBtnExitClick(Sender: TObject);
    procedure Activa_Objetos(bPar: boolean);
    procedure oGrid_LstTitleClick(Column: TColumnEh);
    procedure oBtn_DoitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure oBtnEditClick(Sender: TObject);
    procedure oGrid_LstDblClick(Sender: TObject);
    procedure oBtn_SaveClick(Sender: TObject);
  private
    iOption: integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fimports_1: Tfimports_1;

implementation

uses UtilesV20, BuscarGenM2, change_val;
{$R *.dfm}

procedure Tfimports_1.FormShow(Sender: TObject);
begin
  self.oFecha_Busq.Value := now();
  self.oLst_tipo.ItemIndex := 0;
end;

procedure Tfimports_1.oBtnEditClick(Sender: TObject);
begin
  self.oQry_Ctas.Edit;
  Application.CreateForm(Tfchange_val, fchange_val);
  fchange_val.ShowModal;
  fchange_val.Free;
end;

procedure Tfimports_1.oBtnExitClick(Sender: TObject);
begin
  self.close;
end;

procedure Tfimports_1.oBtn_DoitClick(Sender: TObject);
var
  cSql_Ln: string;
  bPers, bProv: boolean;
begin
  cSql_Ln := 'DROP TABLE IF EXISTS `tmp`.`dep_ctas` ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  if self.oLst_tipo.ItemIndex = 0 then
  begin
    bPers := true;
  end;

  if self.oLst_tipo.ItemIndex = 1 then
  begin
    bProv := true;
  end;

  if self.oLst_tipo.ItemIndex = 2 then
  begin
    bProv := true;
    bPers := true;
  end;

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'CREATE TABLE `tmp`.`dep_ctas` ';
  if (bPers = true) then
  begin
    cSql_Ln := cSql_Ln + 'SELECT ';
    cSql_Ln := cSql_Ln + '  "PERSONAL"	AS cfield1, ';
    cSql_Ln := cSql_Ln + '  MID(pe.pers_ban_cta		,1,17) 	AS Bnc_Cta, ';
    cSql_Ln := cSql_Ln + '  MID(pe.pers_ban_nombre,1,30)	AS Bnc_Nom, ';
    cSql_Ln := cSql_Ln + '  pe.pers_ban_tipo	AS Bnc_Tip, ';
    cSql_Ln := cSql_Ln + '  CASE pe.pers_ban_tipo ';
    cSql_Ln := cSql_Ln + '  WHEN "C" THEN "CUENTA CLIENTE " ';
    cSql_Ln := cSql_Ln + '  WHEN "S" THEN "CUENTA AHORRO  " ';
    cSql_Ln := cSql_Ln + '  WHEN "T" THEN "TARJETA CREDITO" ';
    cSql_Ln := cSql_Ln + '  WHEN "L" THEN "PRESTAMO       " ';
    cSql_Ln := cSql_Ln + '  ELSE "               " ';
    cSql_Ln := cSql_Ln + '  END AS Bnc_Tip2, ';
    cSql_Ln := cSql_Ln + '  SPACE(9) 				  AS Bnc_Cod, ';
    cSql_Ln := cSql_Ln + '  pe.pers_salario		AS Pag_Mon, ';
    cSql_Ln := cSql_Ln + '  RPAD("PAGO DE PLANILLA",30," ") AS Pag_Des ';
    cSql_Ln := cSql_Ln + 'FROM ' + trim(UtilesV20.oSetting_Fac.database) + '.personal pe ';
    cSql_Ln := cSql_Ln + 'WHERE pe.pers_fecha_crea >="' + formatdatetime('yyyy-mm-dd hh:nn:ss',
      self.oFecha_Busq.Value) + '" ';
  end;

  if (bProv = true) and (bPers = true) then
    cSql_Ln := cSql_Ln + 'UNION ';

  if (bProv = true) then
  begin
    cSql_Ln := cSql_Ln + 'SELECT ';
    cSql_Ln := cSql_Ln + '  "PROVEEDOR"	AS cfield1, ';
    cSql_Ln := cSql_Ln + '  MID(pr.prov_ban_cta		,1,17) 	AS Bnc_Cta, ';
    cSql_Ln := cSql_Ln + '  MID(pr.prov_ban_nombre,1,30)	AS Bnc_Nom, ';
    cSql_Ln := cSql_Ln + '  pr.prov_ban_tipo	AS Bnc_Tip, ';
    cSql_Ln := cSql_Ln + '  CASE pr.prov_ban_tipo ';
    cSql_Ln := cSql_Ln + '  WHEN "C" THEN "CUENTA CLIENTE " ';
    cSql_Ln := cSql_Ln + '  WHEN "S" THEN "CUENTA AHORRO  " ';
    cSql_Ln := cSql_Ln + '  WHEN "T" THEN "TARJETA CREDITO" ';
    cSql_Ln := cSql_Ln + '  WHEN "L" THEN "PRESTAMO       " ';
    cSql_Ln := cSql_Ln + '  ELSE "               " ';
    cSql_Ln := cSql_Ln + '  END AS Bnc_Tip2, ';
    cSql_Ln := cSql_Ln + '  SPACE(9) 				  AS Bnc_Cod, ';
    cSql_Ln := cSql_Ln + '  0000000000.00			AS Pag_Mon, ';
    cSql_Ln := cSql_Ln + '  SPACE(30) 				AS Pag_Des ';
    cSql_Ln := cSql_Ln + 'FROM  ' + trim(UtilesV20.oSetting_Fac.database) + '.proveedores pr ';
    cSql_Ln := cSql_Ln + 'WHERE pr.prov_fecha_alta>="' + formatdatetime('yyyy-mm-dd hh:nn:ss',
      self.oFecha_Busq.Value) + '" ';
  end;
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'ALTER TABLE `tmp`.`dep_ctas` ';
  cSql_Ln := cSql_Ln + '	ADD COLUMN `autoinc` INT NOT NULL AUTO_INCREMENT FIRST, ';
  cSql_Ln := cSql_Ln + '	ADD PRIMARY KEY (`autoinc`) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  self.oQry_Ctas.close;
  self.oQry_Ctas.Connection := fUtilesV20.oPublicCnn;
  self.oQry_Ctas.sql.text := 'SELECT * FROM `tmp`.`dep_ctas` ';
  self.oQry_Ctas.Open;

  self.oGrid_Lst.Refresh;
end;

procedure Tfimports_1.oBtn_SaveClick(Sender: TObject);
var
  sRegLine: WIDEstring;
  cDate, cValue: STRING;
  OutPutList: TStringList;
  cCedp1, cCedp2, cCedp3: STRING;
begin
  if (self.oQry_Ctas.RecordCount <= 0) then
    exit;

  OutPutList := TStringList.Create;

  self.oTxtFile.Clear;
  self.oTxtFile.Refresh;

  sRegLine := 'C';
  cValue := trim(self.oGrid_Lst.Columns[2].Footers[0].SumValue);
  sRegLine := sRegLine + fUtilesV20.PadL(cValue, 9, '0');
  cValue := trim(self.oGrid_Lst.Columns[6].Footers[0].SumValue);
  sRegLine := sRegLine + fUtilesV20.PadL(cValue, 12, '0');
  self.oTxtFile.Lines.Add(sRegLine);

  while NOT self.oQry_Ctas.Eof do
  begin
    if (fUtilesV20.RoundD(self.oQry_Ctas.FieldByName('Pag_Mon').AsFloat, 2) > 0.00) then
    begin
      sRegLine := 'D';
      sRegLine := sRegLine + 'C';
      sRegLine := sRegLine + fUtilesV20.PadR(trim(self.oQry_Ctas.FieldByName('Bnc_Cta').AsString), 17, ' ');
      sRegLine := sRegLine + fUtilesV20.PadR(trim(self.oQry_Ctas.FieldByName('Bnc_Nom').AsString), 30, ' ');
      sRegLine := sRegLine + trim(self.oQry_Ctas.FieldByName('Bnc_Tip').AsString);
      sRegLine := sRegLine + fUtilesV20.PadL(trim('1234'), 9, '0');
      sRegLine := sRegLine + fUtilesV20.PadL(trim(formatfloat('0.00', self.oQry_Ctas.FieldByName('Pag_Mon').AsFloat)
        ), 12, '0');
      sRegLine := sRegLine + fUtilesV20.PadR(trim(self.oQry_Ctas.FieldByName('Pag_Des').AsString), 32, ' ');
      self.oTxtFile.Lines.Add(sRegLine);
      OutPutList.Clear;
    end;
    self.oQry_Ctas.Next;
  end;
  sRegLine := 'T';
  cValue := trim(self.oGrid_Lst.Columns[2].Footers[0].SumValue);
  sRegLine := sRegLine + fUtilesV20.PadL(cValue, 9, '0');
  cValue := trim(self.oGrid_Lst.Columns[6].Footers[0].SumValue);
  sRegLine := sRegLine + fUtilesV20.PadL(cValue, 12, '0');

  self.oTxtFile.Lines.Add(sRegLine);
  self.oTxtFile.Refresh;
end;

procedure Tfimports_1.Activa_Objetos(bPar: boolean);
var
  i: Word;
begin
  for i := 0 to self.ComponentCount - 1 do
  begin
    if (self.Components[i] is TDBComboBoxEh) then
      TDBComboBoxEh(self.Components[i]).Enabled := bPar;
    if (self.Components[i] is TDBEdit) then
      TDBEdit(self.Components[i]).Enabled := bPar;
    if (self.Components[i] is TDBMemo) then
      TDBMemo(self.Components[i]).Enabled := bPar;
    if (self.Components[i] is TDBNumberEditEh) then
      TDBNumberEditEh(self.Components[i]).Enabled := bPar;
    if (self.Components[i] is TDBCheckBox) then
      TDBCheckBox(self.Components[i]).Enabled := bPar;
    if (self.Components[i] is TDBLookupComboBox) then
      TDBLookupComboBox(self.Components[i]).Enabled := bPar;
    if (self.Components[i] is TBitBtn) then
    begin
      if TBitBtn(self.Components[i]).tag = 20 then
        TBitBtn(self.Components[i]).Enabled := bPar;
    end;
  end;
  // self.oAutoinc.Enabled := false;
end;

procedure Tfimports_1.oGrid_LstDblClick(Sender: TObject);
begin
  self.oQry_Ctas.Edit;
  Application.CreateForm(Tfchange_val, fchange_val);
  fchange_val.ShowModal;
  fchange_val.Free;
end;

procedure Tfimports_1.oGrid_LstTitleClick(Column: TColumnEh);
{$J+}
const
  PreviousColumnIndex: integer = 1;
{$J-}
begin
  try
    oGrid_Lst.Columns[PreviousColumnIndex].title.Font.Style := oGrid_Lst.Columns[PreviousColumnIndex].title.Font.Style
      - [fsBold];
  except
  end;

  Column.title.Font.Style := Column.title.Font.Style + [fsBold];
  PreviousColumnIndex := Column.Index;

  if (Pos(Column.Field.FieldName, oQry_Ctas.IndexFieldNames) = 1) and
    (Pos(' DESC', uppercase(oQry_Ctas.IndexFieldNames)) = 0) then
    oQry_Ctas.IndexFieldNames := Column.Field.FieldName + ':D'
  else
    oQry_Ctas.IndexFieldNames := Column.Field.FieldName + ':A';

  oQry_Ctas.First;
end;

end.
