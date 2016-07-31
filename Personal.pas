unit Personal;

interface

uses
  Windows, Messages, SysUtils, FileCtrl,
  Variants, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, DBCtrls,
  Mask, ExtCtrls, ComCtrls, Buttons,
  GridsEh, DBGridEh, DB, DBCtrlsEh,
  PngBitBtn, PngSpeedButton, WideStrings,
  SqlExpr, DBLookupEh,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, ieview, imageenview, dbimageen, ieopensavedlg,
  imageenproc, hyiedefs, SynEdit, SynMemo, Vcl.ExtDlgs;

type
  TfPersonal = class(TForm)
    oDBNav: TDBNavigator;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    oDS_Person: TDataSource;
    StatusBar1: TStatusBar;
    opers_inactivo: TDBCheckBox;
    Label5: TLabel;
    Label3: TLabel;
    opers_nom_prim: TDBEdit;
    Label4: TLabel;
    TabSheet2: TTabSheet;
    opers_nom_seg: TDBEdit;
    opers_movil: TDBEdit;
    opers_telef: TDBEdit;
    Label7: TLabel;
    Label10: TLabel;
    opers_correo: TDBEdit;
    Label12: TLabel;
    oBtnExit: TPngBitBtn;
    oBtnAbort: TPngBitBtn;
    oBtnSave: TPngBitBtn;
    oBtnFind: TPngBitBtn;
    oBtnDelete: TPngBitBtn;
    oBtnEdit: TPngBitBtn;
    oBtnNew: TPngBitBtn;
    oBtnPrint: TPngBitBtn;
    oid_autoinc: TDBEdit;
    Label14: TLabel;
    opers_notas: TDBMemo;
    Label15: TLabel;
    Label16: TLabel;
    opers_fecha_crea: TDBDateTimeEditEh;
    Label17: TLabel;
    opers_fecha_mod: TDBDateTimeEditEh;
    otPerson: TFDTable;
    Label11: TLabel;
    opers_apell_prim: TDBEdit;
    Label21: TLabel;
    opers_apell_seg: TDBEdit;
    opers_nip: TDBEdit;
    Label22: TLabel;
    opers_sexo: TDBComboBoxEh;
    Label23: TLabel;
    opers_ciudad: TDBEdit;
    Label24: TLabel;
    Label9: TLabel;
    Label25: TLabel;
    Label18: TLabel;
    otPais: TFDTable;
    oDs_Pais: TDataSource;
    Label8: TLabel;
    opers_pais: TDBLookupComboBox;
    opers_fecha_nac: TDBDateTimeEditEh;
    opers_estado_civil: TDBComboBoxEh;
    opers_salario: TDBNumberEditEh;
    opers_imagen: TImageEnDBView;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    oOpenImageEnDialog1: TOpenImageEnDialog;
    ImageEnProc1: TImageEnProc;
    TabSheet3: TTabSheet;
    oBtn_Doit: TPngBitBtn;
    opers_dire_1: TDBEdit;
    opers_dire_2: TDBEdit;
    oTxtFile: TSynMemo;
    oBtn_Save: TPngBitBtn;
    SaveTextFileDialog1: TSaveTextFileDialog;
    oFecha_Busq: TDBDateTimeEditEh;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label2: TLabel;
    Label19: TLabel;
    opers_ban_cta: TDBEdit;
    opers_ban_nombre: TDBEdit;
    opers_ban_tipo: TDBComboBoxEh;
    opers_quest1: TDBCheckBox;
    opers_quest2: TDBCheckBox;
    opers_quest3: TDBCheckBox;
    pers_quest4: TDBCheckBox;
    Label6: TLabel;
    procedure Action_Control(pOption: integer);
    procedure oBtnNewClick(Sender: TObject);
    procedure oBtnEditClick(Sender: TObject);
    procedure oBtnDeleteClick(Sender: TObject);
    procedure oBtnFindClick(Sender: TObject);
    procedure oBtnPrintClick(Sender: TObject);
    procedure oBtnSaveClick(Sender: TObject);
    procedure oBtnAbortClick(Sender: TObject);
    procedure oBtnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ZTable1AfterPost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure opers_nom_primKeyPress(Sender: TObject; var Key: Char);
    procedure opers_nom_segKeyPress(Sender: TObject; var Key: Char);
    procedure opers_correoKeyPress(Sender: TObject; var Key: Char);
    procedure opers_movilKeyPress(Sender: TObject; var Key: Char);
    procedure opers_telefKeyPress(Sender: TObject; var Key: Char);
    procedure Activa_Objetos(bPar: boolean);
    procedure opers_nom_primExit(Sender: TObject);
    procedure otPersonAfterInsert(DataSet: TDataSet);
    procedure otPersonBeforePost(DataSet: TDataSet);
    procedure opers_apell_primExit(Sender: TObject);
    procedure opers_nom_segExit(Sender: TObject);
    procedure opers_apell_segExit(Sender: TObject);
    procedure opers_apell_primKeyPress(Sender: TObject; var Key: Char);
    procedure opers_apell_segKeyPress(Sender: TObject; var Key: Char);
    procedure opers_sexoKeyPress(Sender: TObject; var Key: Char);
    procedure Next_Object(var Key: Char);
    procedure opers_paisKeyPress(Sender: TObject; var Key: Char);
    procedure opers_salarioKeyPress(Sender: TObject; var Key: Char);
    procedure opers_estado_civilKeyPress(Sender: TObject; var Key: Char);
    procedure opers_ciudadKeyPress(Sender: TObject; var Key: Char);
    procedure oid_autoincKeyPress(Sender: TObject; var Key: Char);
    procedure opers_nipKeyPress(Sender: TObject; var Key: Char);
    procedure Clear_Screen;
    procedure opers_nipExit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure oBtn_DoitClick(Sender: TObject);
    procedure opers_dire_1KeyPress(Sender: TObject; var Key: Char);
    procedure opers_dire_2KeyPress(Sender: TObject; var Key: Char);
    procedure oBtn_SaveClick(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
  private
    iOption: integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPersonal: TfPersonal;

implementation

USES UtilesV20, BuscarGenM2, Municipios, Rutas;
{$R *.dfm}

procedure TfPersonal.FormCreate(Sender: TObject);
begin
  iOption := 0;
  // self.ResizeKit1.Enabled := utiles.Ctrl_Resize;
  self.PageControl1.ActivePageIndex := 0;
  self.otPerson.Connection := fUtilesV20.oPublicCnn;
  self.otPais.Connection := fUtilesV20.oPublicCnn;
  self.otPais.Active := true;
  self.otPerson.Active := true;

  self.oDS_Person.DataSet := otPerson;
  self.oDS_Person.Enabled := true;

  self.oDs_Pais.DataSet := otPais;
  self.oDs_Pais.Enabled := true;

  self.otPais.Active := true;
  self.oTxtFile.text := '';
end;

procedure TfPersonal.FormShow(Sender: TObject);
begin
  self.PageControl1.ActivePageIndex := 0;
  self.Action_Control(6);
  self.Activa_Objetos(false);
  self.oFecha_Busq.Value := now();
end;

procedure TfPersonal.oBtnAbortClick(Sender: TObject);
begin
  self.otPerson.Cancel;
  self.Action_Control(7);
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
  iOption := 0;
  self.TabSheet3.TabVisible := true;
end;

procedure TfPersonal.oBtnDeleteClick(Sender: TObject);
var
  nResp: integer;
begin
  if self.otPerson.isEmpty then
  begin
    self.Action_Control(6);
    exit;
  end;
  iOption := 3;
  self.Action_Control(iOption);
  nResp := MessageDlg('Seguro que desea borrar eliminar el registro alctual?', mtConfirmation, [mbYes, mbNo], 0);
  If (nResp = mrYes) Then
  begin
    self.oDBNav.DataSource.DataSet.Delete;
    self.oDBNav.DataSource.DataSet.Refresh;
  end;
  iOption := 0;
end;

procedure TfPersonal.oBtnEditClick(Sender: TObject);
begin
  if self.otPerson.isEmpty then
  begin
    self.Action_Control(6);
    exit;
  end;
  self.TabSheet3.TabVisible := false;
  iOption := 2;
  self.PageControl1.ActivePageIndex := 0;
  self.otPerson.Edit;
  self.Action_Control(iOption);
  self.Activa_Objetos(true);
  self.opers_nom_prim.SetFocus;
end;

procedure TfPersonal.oBtnExitClick(Sender: TObject);
begin
  self.close;
end;

procedure TfPersonal.oBtnFindClick(Sender: TObject);
begin
  iOption := 4;
  self.Action_Control(iOption);

  Application.CreateForm(TfBuscarGenM2, fBuscarGenM2);
  fBuscarGenM2.Hide;
  fBuscarGenM2.oLst_campos.Clear;

  BuscarGenM2.oListData[1].Texto := 'N.I.P.';
  BuscarGenM2.oListData[1].Campo := 'pers_nip';
  BuscarGenM2.oListData[1].LLave := true;

  BuscarGenM2.oListData[2].Texto := 'Primer Nombre';
  BuscarGenM2.oListData[2].Campo := 'pers_nom_prim';
  BuscarGenM2.oListData[2].LLave := false;

  BuscarGenM2.oListData[3].Texto := 'Primer Apellido';
  BuscarGenM2.oListData[3].Campo := 'pers_apell_prim';
  BuscarGenM2.oListData[3].LLave := false;

  fBuscarGenM2.oSql1.Clear;
  fBuscarGenM2.oSql1.Lines.Add
    ('SELECT pers_nip,UCASE(pers_nom_prim) as pers_nom_prim,UCASE(pers_apell_prim) as pers_apell_prim FROM personal WHERE 1=1 ');
  fBuscarGenM2.ShowModal;
  if BuscarGenM2.vFindResult <> '' then
    self.oDBNav.DataSource.DataSet.Locate('pers_nip', BuscarGenM2.vFindResult, []);
  freeandnil(fBuscarGenM2);
  iOption := 0;
end;

procedure TfPersonal.oBtnNewClick(Sender: TObject);
begin
  iOption := 1;
  self.TabSheet3.TabVisible := false;
  self.PageControl1.ActivePageIndex := 0;
  self.otPerson.Insert;
  // self.Clear_Screen;
  self.opers_inactivo.Checked := true;
  self.Action_Control(iOption);
  self.Activa_Objetos(true);
  self.otPerson.FieldByName('pers_inactivo').Value := 0;
  self.otPerson.FieldByName('pers_pais').Value := 'PA';
  self.otPerson.FieldByName('pers_ciudad').Value := 'PANAMA';
  self.otPerson.FieldByName('pers_sexo').Value := 'M';
  self.otPerson.FieldByName('pers_correo').Value := 'notiene@hotmail.com';
  self.otPerson.FieldByName('pers_estado_civil').Value := 1;
  self.otPerson.FieldByName('pers_salario').Value := 0.00;
  self.opers_nip.SetFocus;
end;

procedure TfPersonal.oBtnPrintClick(Sender: TObject);
begin
  iOption := 5;
  self.Action_Control(iOption);
  ShowMessage('Opci�n a�n no programada.');
  iOption := 0;
end;

procedure TfPersonal.oBtnSaveClick(Sender: TObject);
begin
  self.otPerson.post;
  self.Action_Control(6);
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
  iOption := 0;
  self.TabSheet3.TabVisible := true;
end;

procedure TfPersonal.oid_autoincKeyPress(Sender: TObject; var Key: Char);
begin
  self.Next_Object(Key);
end;

procedure TfPersonal.opers_apell_primExit(Sender: TObject);
begin
  if ((fUtilesV20.isEmpty(self.opers_apell_prim.text) = true) or (self.opers_apell_prim.text = null)) then
    self.otPerson.FieldByName('pers_apell_prim').AsString := self.opers_apell_prim.text;
end;

procedure TfPersonal.opers_apell_primKeyPress(Sender: TObject; var Key: Char);
begin
  self.Next_Object(Key);
end;

procedure TfPersonal.opers_apell_segExit(Sender: TObject);
begin
  if ((fUtilesV20.isEmpty(self.opers_apell_seg.text) = true) or (self.opers_apell_seg.text = null)) then
    self.otPerson.FieldByName('pers_apell_seg').AsString := self.opers_apell_seg.text;

end;

procedure TfPersonal.opers_apell_segKeyPress(Sender: TObject; var Key: Char);
begin
  self.Next_Object(Key);
end;

procedure TfPersonal.opers_correoKeyPress(Sender: TObject; var Key: Char);
begin
  self.Next_Object(Key);
end;

procedure TfPersonal.opers_dire_1KeyPress(Sender: TObject; var Key: Char);
begin
  self.Next_Object(Key);
end;

procedure TfPersonal.opers_dire_2KeyPress(Sender: TObject; var Key: Char);
begin
  self.Next_Object(Key);
end;

procedure TfPersonal.opers_estado_civilKeyPress(Sender: TObject; var Key: Char);
begin
  self.Next_Object(Key);
end;

procedure TfPersonal.opers_nipExit(Sender: TObject);
VAR
  cValue: string;
  cSql_Ln: string;
begin
  if (trim(self.opers_nip.text) <> '') then
  begin
    if (iOption = 1) then
    begin
      cSql_Ln := '';
      cSql_Ln := cSql_Ln + 'SELECT IFNULL(pers_nip,"") AS pers_nip ';
      cSql_Ln := cSql_Ln + 'FROM personal ';
      cSql_Ln := cSql_Ln + 'WHERE pers_nip= "' + trim(self.opers_nip.text) + '"';
      cValue := UtilesV20.Execute_SQL_Result(cSql_Ln);
      if (cValue <> '') then
      begin
        MessageDlg('El n�mero de indentificasi�n personal YA EXISTE EN LA BASE DE DATOS.', mtWarning, [mbOK], 0);
        self.opers_nip.text := '';
        self.opers_nip.SetFocus;
        exit;
      end;
    end;

    if (iOption = 2) then
    begin
      cSql_Ln := '';
      cSql_Ln := cSql_Ln + 'SELECT IFNULL(pers_nip,"") AS pers_nip ';
      cSql_Ln := cSql_Ln + 'FROM personal ';
      cSql_Ln := cSql_Ln + 'WHERE id_autoinc <>"' + trim(self.oid_autoinc.text) + '" ';
      cSql_Ln := cSql_Ln + 'AND   pers_nip= "' + trim(self.opers_nip.text) + '"';

      cValue := UtilesV20.Execute_SQL_Result(cSql_Ln);
      if (cValue <> '') then
      begin
        MessageDlg('El n�mero de indentificasi�n personal YA EXISTE EN LA BASE DE DATOS.', mtWarning, [mbOK], 0);
        self.opers_nip.text := '';
        self.opers_nip.SetFocus;
        exit;
      end;
    end;
  end;

end;

procedure TfPersonal.opers_nipKeyPress(Sender: TObject; var Key: Char);
begin
  self.Next_Object(Key);
end;

procedure TfPersonal.opers_nom_primExit(Sender: TObject);
begin
  if ((fUtilesV20.isEmpty(self.opers_nom_prim.text) = true) or (self.opers_nom_prim.text = null)) then
    self.otPerson.FieldByName('pers_nom_prim').AsString := self.opers_nom_prim.text;
end;

procedure TfPersonal.opers_nom_primKeyPress(Sender: TObject; var Key: Char);
begin
  self.Next_Object(Key);
end;

procedure TfPersonal.opers_nom_segExit(Sender: TObject);
begin
  if ((fUtilesV20.isEmpty(self.opers_nom_seg.text) = true) or (self.opers_nom_seg.text = null)) then
    self.otPerson.FieldByName('pers_nom_seg').AsString := self.opers_nom_seg.text;

end;

procedure TfPersonal.opers_nom_segKeyPress(Sender: TObject; var Key: Char);
begin
  self.Next_Object(Key);
end;

procedure TfPersonal.opers_paisKeyPress(Sender: TObject; var Key: Char);
begin
  self.Next_Object(Key);
end;

procedure TfPersonal.opers_sexoKeyPress(Sender: TObject; var Key: Char);
begin
  self.Next_Object(Key);
end;

procedure TfPersonal.otPersonAfterInsert(DataSet: TDataSet);
begin
  if (DataSet.State in [dsInsert]) then
  begin
    DataSet.FieldByName('pers_inactivo').Value := 0;
  end;
end;

procedure TfPersonal.otPersonBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State in [dsEdit, dsInsert]) then
  begin
    if fUtilesV20.isEmpty(DataSet.FieldByName('pers_nom_prim').AsString) then
    begin
      ShowMessage('Para crear un personal, es necesario por lo menos el primer nombre.');
      self.PageControl1.TabIndex := 0;
      self.opers_nom_prim.SetFocus;
      abort;
    end;

    if fUtilesV20.isEmpty(DataSet.FieldByName('pers_apell_prim').AsString) then
    begin
      ShowMessage('Para crear un personal, es necesario por lo menos el primer apellido.');
      self.PageControl1.TabIndex := 0;
      self.opers_apell_prim.SetFocus;
      abort;
    end;

    if (DataSet.State = dsEdit) then
    begin
      DataSet.FieldByName('pers_fecha_mod').Value := now();
      DataSet.FieldByName('pers_usua_mod').Value := UtilesV20.sUserName;
    end
    else if (DataSet.State = dsInsert) then
    begin
      DataSet.FieldByName('pers_fecha_crea').Value := now();
      DataSet.FieldByName('pers_usua_crea').Value := UtilesV20.sUserName;
    end;
  end;
end;

procedure TfPersonal.TabSheet3Show(Sender: TObject);
begin
  self.oTxtFile.text := '';
end;

procedure TfPersonal.oBtn_DoitClick(Sender: TObject);
var
  sRegLine: WIDEstring;
  cDate, cValue: STRING;
  cNum_Cte_Emp, cNum_Cta_Emp: STRING;
  OutPutList: TStringList;
  cCedp1, cCedp2, cCedp3: STRING;
begin
  cNum_Cte_Emp := '2436144';
  OutPutList := TStringList.Create;

  self.oTxtFile.Clear;
  self.oTxtFile.Refresh;
  sRegLine := 'C';
  cValue := inttostr(self.otPerson.RecordCount);
  sRegLine := sRegLine + fUtilesV20.PadL(trim(cValue), 9, '0');
  sRegLine := sRegLine + fUtilesV20.PadL(trim(cNum_Cte_Emp), 10, ' ');
  self.oTxtFile.Lines.Add(sRegLine);

  if (self.otPerson.RecordCount > 0) then
    self.otPerson.First;

  while NOT self.otPerson.Eof do
  begin
    if (self.otPerson.FieldByName('pers_fecha_crea').AsDateTime >= self.oFecha_Busq.Value) then
    begin
      sRegLine := 'D';
      Classes.ExtractStrings(['-'], [], PChar(trim(self.otPerson.FieldByName('pers_nip').AsString)), OutPutList);
      case OutPutList.Count of
        0:
          begin
            cCedp1 := '0';
            cCedp2 := '0';
            cCedp3 := '0';
          end;
        1:
          begin
            cCedp1 := fUtilesV20.iif(trim(OutPutList[0]) = '', '0', copy(trim(OutPutList[0]),1,2));
            cCedp2 := '0';
            cCedp3 := '0';
          end;
        2:
          begin
            cCedp1 := fUtilesV20.iif(trim(OutPutList[0]) = '', '0', copy(trim(OutPutList[0]),1,2));
            cCedp2 := fUtilesV20.iif(trim(OutPutList[1]) = '', '0', copy(trim(OutPutList[1]),1,5));
            cCedp3 := '0';
          end;
      else
        begin
          cCedp1 := fUtilesV20.iif(trim(OutPutList[0]) = '', '0', copy(trim(OutPutList[0]),1,2));
          cCedp2 := fUtilesV20.iif(trim(OutPutList[1]) = '', '0', copy(trim(OutPutList[1]),1,5));
          cCedp3 := fUtilesV20.iif(trim(OutPutList[2]) = '', '0', copy(trim(OutPutList[2]),1,6));
        end;
      end;
      sRegLine := sRegLine + fUtilesV20.PadL(cCedp1, 2, '0') + '-' + fUtilesV20.PadL(cCedp2, 5, '0') + '-' +
        fUtilesV20.PadL(cCedp3, 6, '0');
      sRegLine := sRegLine + fUtilesV20.PadL('CED', 3, '0');
      sRegLine := sRegLine + fUtilesV20.PadL(trim(self.otPerson.FieldByName('pers_pais').AsString), 2, ' ');
      sRegLine := sRegLine + fUtilesV20.PadR(trim(self.otPerson.FieldByName('pers_nom_prim').AsString), 30, ' ');
      sRegLine := sRegLine + fUtilesV20.PadR(trim(self.otPerson.FieldByName('pers_nom_seg').AsString), 30, ' ');
      sRegLine := sRegLine + fUtilesV20.PadR(trim(self.otPerson.FieldByName('pers_apell_prim').AsString), 30, ' ');
      sRegLine := sRegLine + fUtilesV20.PadR(trim(self.otPerson.FieldByName('pers_apell_seg').AsString), 30, ' ');
      sRegLine := sRegLine + fUtilesV20.PadR(trim(self.otPerson.FieldByName('pers_dire_1').AsString), 60, ' ');
      sRegLine := sRegLine + fUtilesV20.PadR(trim(self.otPerson.FieldByName('pers_dire_2').AsString), 60, ' ');
      sRegLine := sRegLine + fUtilesV20.PadR(trim(self.otPerson.FieldByName('pers_ciudad').AsString), 30, ' ');

      cValue := UtilesV20.Execute_SQL_Result('SELECT PaisNombre FROM pais WHERE PaisCodigo2="' +
        trim(self.otPerson.FieldByName('pers_pais').AsString) + '"');
      sRegLine := sRegLine + fUtilesV20.PadR(trim(cValue), 20, ' ');

      sRegLine := sRegLine + fUtilesV20.PadL(trim(self.otPerson.FieldByName('pers_sexo').AsString), 1, ' ');
      sRegLine := sRegLine + fUtilesV20.PadL(trim(self.otPerson.FieldByName('pers_estado_civil').AsString), 1, '0');

      cValue := formatdatetime('ddmmyyyy', self.otPerson.FieldByName('pers_fecha_nac').AsDateTime);
      sRegLine := sRegLine + fUtilesV20.PadL(trim(cValue), 8, ' ');

      sRegLine := sRegLine + fUtilesV20.PadL(trim(self.otPerson.FieldByName('pers_telef').AsString), 11, '9');
      cValue := fUtilesV20.iif(trim(self.otPerson.FieldByName('pers_correo').AsString) = '', 'notiene@hotmail.com',
        self.otPerson.FieldByName('pers_correo').AsString);
      sRegLine := sRegLine + fUtilesV20.PadR(trim(cValue), 40, ' ');
      sRegLine := sRegLine + fUtilesV20.PadL(trim('0'), 12, '0');
      sRegLine := sRegLine + fUtilesV20.iif(self.otPerson.FieldByName('pers_quest1').AsInteger = 1, 'Y', 'N');
      sRegLine := sRegLine + fUtilesV20.iif(self.otPerson.FieldByName('pers_quest2').AsInteger = 1, 'Y', 'N');
      sRegLine := sRegLine + fUtilesV20.iif(self.otPerson.FieldByName('pers_quest3').AsInteger = 1, 'Y', 'N');
      sRegLine := sRegLine + fUtilesV20.iif(self.otPerson.FieldByName('pers_quest4').AsInteger = 1, 'Y', 'N');
      self.oTxtFile.Lines.Add(sRegLine);
      OutPutList.Clear;
    end;
    self.otPerson.Next;
  end;
  sRegLine := 'T';
  cValue := inttostr(self.otPerson.RecordCount);
  sRegLine := sRegLine + fUtilesV20.PadL(trim(cValue), 9, '0');
  sRegLine := sRegLine + fUtilesV20.PadL(trim(cNum_Cte_Emp), 10, ' ');
  self.oTxtFile.Lines.Add(sRegLine);
  self.oTxtFile.Refresh;
end;

procedure TfPersonal.oBtn_SaveClick(Sender: TObject);
begin
  SaveTextFileDialog1.Title := 'Guardar el archivo de TXT en?';
  SaveTextFileDialog1.InitialDir := GetCurrentDir;
  SaveTextFileDialog1.Filter := 'Text file|*.txt';
  SaveTextFileDialog1.DefaultExt := 'txt';
  SaveTextFileDialog1.FilterIndex := 1;
  if SaveTextFileDialog1.Execute then
    self.oTxtFile.Lines.SaveToFile(SaveTextFileDialog1.FileName);
end;

procedure TfPersonal.opers_movilKeyPress(Sender: TObject; var Key: Char);
begin
  self.Next_Object(Key);
end;

procedure TfPersonal.opers_telefKeyPress(Sender: TObject; var Key: Char);
begin
  self.Next_Object(Key);
end;

procedure TfPersonal.ZTable1AfterPost(DataSet: TDataSet);
begin
  if fUtilesV20.isEmpty(DataSet.FieldByName('cte_nombre_com').AsString) then
  begin
    ShowMessage('Para crear un cliente es necesario por lo menos el nombre del cliente.');
    abort;
  end;
end;

procedure TfPersonal.Action_Control(pOption: integer);
begin
  if ((pOption = 1) or (pOption = 2)) then
  begin
    oDBNav.Visible := false;
    oBtnNew.Visible := false;
    oBtnEdit.Visible := false;
    oBtnDelete.Visible := false;
    oBtnFind.Visible := false;
    oBtnPrint.Visible := false;
    oBtnExit.Enabled := false;

    oBtnSave.Top := oBtnNew.Top;
    oBtnSave.Left := oBtnNew.Left;

    oBtnAbort.Top := oBtnEdit.Top;
    oBtnAbort.Left := oBtnEdit.Left;

    oBtnAbort.Visible := true;
    oBtnSave.Visible := true;
    oBtnExit.Visible := false;

  end;

  if ((pOption = 6) or (pOption = 7)) then
  begin
    oDBNav.Visible := true;
    oBtnNew.Visible := true;
    oBtnEdit.Visible := true;
    oBtnDelete.Visible := true;
    oBtnFind.Visible := true;
    oBtnPrint.Visible := false;
    oBtnExit.Enabled := true;
    oBtnSave.Top := oBtnNew.Top;
    oBtnSave.Left := oBtnNew.Left;

    oBtnAbort.Top := oBtnEdit.Top;
    oBtnAbort.Left := oBtnEdit.Left;

    oBtnAbort.Visible := false;
    oBtnSave.Visible := false;
    oBtnExit.Visible := true;

  end;

end;

procedure TfPersonal.Activa_Objetos(bPar: boolean);
var
  i: Word;
begin
  for i := 0 to self.ComponentCount - 1 do
  begin

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

    if (self.Components[i] is TDBDateTimeEditEh) then
      TDBDateTimeEditEh(self.Components[i]).Enabled := bPar;

    if (self.Components[i] is TDBComboBoxEh) then
      TDBComboBoxEh(self.Components[i]).Enabled := bPar;

    if (self.Components[i] is TBitBtn) then
    begin
      if TBitBtn(self.Components[i]).tag = 20 then
        TBitBtn(self.Components[i]).Enabled := bPar;
    end;

    if (self.Components[i] is TButton) then
    begin
      TButton(self.Components[i]).Enabled := bPar;
    end;
  end;
  self.oFecha_Busq.Enabled := not bPar;
  self.oid_autoinc.Enabled := false;
  self.opers_fecha_crea.Enabled := false;
  self.opers_fecha_mod.Enabled := false;
end;

procedure TfPersonal.Button1Click(Sender: TObject);
var
  cPath_File: string;
begin
  if oOpenImageEnDialog1.Execute then
  begin
    cPath_File := trim(self.oOpenImageEnDialog1.FileName);
    if FileExists(cPath_File) then
    begin
      self.opers_imagen.IO.LoadFromFile(cPath_File);
      self.otPerson.FieldByName('pers_imagen_path').AsString := cPath_File;
      self.ImageEnProc1.Resample(320, 320, rfLanczos3, true);
    end
    else
      raise Exception.Create('File does not exist.');
  end;
  self.opers_imagen.Repaint;
end;

procedure TfPersonal.Button2Click(Sender: TObject);
begin
  self.opers_imagen.Clear;
  self.otPerson.FieldByName('pers_imagen_path').AsString := '';
end;

procedure TfPersonal.Clear_Screen;
var
  j: integer;
begin
  for j := 0 to ComponentCount - 1 do
  begin
    if (Components[j] is TDBCheckBox) then
    begin
      (Components[j] as TDBCheckBox).Checked := false;
    end;
    if (Components[j] is TDBNumberEditEh) then
    begin
      (Components[j] as TDBNumberEditEh).Value := 0;
    end;
    if (Components[j] is TDBMemo) then
    begin
      (Components[j] as TDBMemo).text := '';
    end;
    if (Components[j] is TDBEdit) then
    begin
      (Components[j] as TDBEdit).text := '';
    end;
    if (Components[j] is TDBDateTimeEditEh) then
    begin
      (Components[j] as TDBDateTimeEditEh).Value := now();
    end;
  end;
end;

procedure TfPersonal.opers_ciudadKeyPress(Sender: TObject; var Key: Char);
begin
  self.Next_Object(Key);
end;

procedure TfPersonal.opers_salarioKeyPress(Sender: TObject; var Key: Char);
begin
  self.Next_Object(Key);
end;

procedure TfPersonal.Next_Object(var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end
end;

end.
