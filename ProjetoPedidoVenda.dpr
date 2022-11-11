program ProjetoPedidoVenda;

uses
  Vcl.Forms,
  projetopedidovenda.view.pedidovenda in 'src\view\projetopedidovenda.view.pedidovenda.pas' {frmPedidoVenda},
  projetopedidovenda.controller.interfaces in 'src\controller\projetopedidovenda.controller.interfaces.pas',
  projetopedidovenda.controller.dto.interfaces in 'src\controller\dto\projetopedidovenda.controller.dto.interfaces.pas',
  projetopedidovenda.model.entity.interfaces in 'src\model\entity\projetopedidovenda.model.entity.interfaces.pas',
  projetopedidovenda.model.entity.cliente in 'src\model\entity\projetopedidovenda.model.entity.cliente.pas',
  projetopedidovenda.model.entity.produto in 'src\model\entity\projetopedidovenda.model.entity.produto.pas',
  projetopedidovenda.model.entity.pedido in 'src\model\entity\projetopedidovenda.model.entity.pedido.pas',
  projetopedidovenda.model.entity.pedidoitens in 'src\model\entity\projetopedidovenda.model.entity.pedidoitens.pas',
  projetopedidovenda.model.service in 'src\model\service\projetopedidovenda.model.service.pas',
  projetopedidovenda.model.resource in 'src\model\resource\projetopedidovenda.model.resource.pas',
  projetopedidovenda.model.conexaofiredac in 'src\model\resource\projetopedidovenda.model.conexaofiredac.pas',
  projetopedidovenda.model.configuracao in 'src\model\resource\projetopedidovenda.model.configuracao.pas',
  projetopedidovenda.model.resource.factory in 'src\model\resource\projetopedidovenda.model.resource.factory.pas',
  projetopedidovenda.model.entity.factory in 'src\model\entity\projetopedidovenda.model.entity.factory.pas',
  projetopedidovenda.model.service.factory in 'src\model\service\projetopedidovenda.model.service.factory.pas',
  projetopedidovenda.controller in 'src\controller\projetopedidovenda.controller.pas',
  projetopedidovenda.controller.dto.cliente in 'src\controller\dto\projetopedidovenda.controller.dto.cliente.pas',
  projetopedidovenda.controller.dto.produto in 'src\controller\dto\projetopedidovenda.controller.dto.produto.pas',
  projetopedidovenda.controller.dto.pedido in 'src\controller\dto\projetopedidovenda.controller.dto.pedido.pas',
  projetopedidovenda.controller.dto.pedidoitens in 'src\controller\dto\projetopedidovenda.controller.dto.pedidoitens.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPedidoVenda, frmPedidoVenda);
  Application.Run;
end.
