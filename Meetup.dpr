program Meetup;

uses
  Vcl.Forms,
  br.com.factorysolution.main in 'main\br.com.factorysolution.main.pas' {FrmMain},
  br.com.factorysolution.model.pessoa in 'model\br.com.factorysolution.model.pessoa.pas',
  br.com.factorysolution.model.vo in 'model\br.com.factorysolution.model.vo.pas',
  br.com.factorysolution.repository.base in 'repository\br.com.factorysolution.repository.base.pas',
  br.com.tecnospeed.service.interfaces in 'service\br.com.tecnospeed.service.interfaces.pas',
  br.com.tecnospeed.service.pessoa.interfaces in 'service\br.com.tecnospeed.service.pessoa.interfaces.pas',
  br.com.tecnospeed.service.pessoa.impl in 'service\br.com.tecnospeed.service.pessoa.impl.pas',
  br.com.factorysolution.controller.interfaces in 'controller\br.com.factorysolution.controller.interfaces.pas',
  br.com.factorysolution.controller.pessoa.interfaces in 'controller\br.com.factorysolution.controller.pessoa.interfaces.pas',
  br.com.factorysolution.controller.pessoa.impl in 'controller\br.com.factorysolution.controller.pessoa.impl.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
