unit Form_Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TFrm_Principal = class(TForm)
    ToolBar1: TToolBar;
    ListView: TListView;
    btn_refresh: TSpeedButton;
    procedure btn_refreshClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

{$R *.fmx}

uses Data_Module;

procedure Add_Tarefa(cod_tarefa : integer; descricao, categoria, status, data, hora : string);
var
        item : TListViewItem;
begin
        with Frm_Principal do
        begin
                item := ListView.Items.Add;

                with item do
                begin
                        item.Text := descricao;
                end;
        end;
end;

procedure TFrm_Principal.btn_refreshClick(Sender: TObject);
begin
        with dm do
        begin
                qry_geral.Active := false;
                qry_geral.sql.Clear;
                qry_geral.sql.Add('SELECT * FROM TAB_TAREFA');
                qry_geral.Active := true;

                while NOT qry_geral.Eof do
                begin
                        Add_Tarefa(qry_geral.FieldByName('COD_TAREFA').AsInteger,
                                   qry_geral.FieldByName('DESCRICAO').AsString,
                                   qry_geral.FieldByName('CATEGORIA').AsString,
                                   qry_geral.FieldByName('STATUS').AsString,
                                   FormatDateTime('dd/mm/yyyy', qry_geral.FieldByName('DATA').AsDateTime),
                                   qry_geral.FieldByName('HORA').AsString);

                        qry_geral.next;
                end;
        end;
end;

end.
