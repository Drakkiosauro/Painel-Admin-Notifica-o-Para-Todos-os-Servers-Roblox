# Painel-Admin-Notifica-o-Para-Todos-os-Servers-Roblox

Painel Administrativo - Mensagens & Manutenção
Interface de gerenciamento para Roblox que permite o envio de notificações globais e alertas de manutenção com contagem regressiva.

Funcionalidades
Interface Dual: Abas separadas para avisos gerais e comunicados de atualização.

Sistema de Timer: Suporte a formatos de tempo variados (ex: 1h, 30m, 120s).

UI Responsiva: Animações de transparência, movimentação e efeitos de hover via TweenService.

Interatividade: Janela arrastável e atalho via teclado (Tecla Z).

Requisitos Técnicos
O script utiliza os seguintes serviços e dependências:

RemoteEvent: Requer um RemoteEvent chamado GlobalSystemEvent dentro do ReplicatedStorage.

Localização: Deve ser executado em um LocalScript (ex: StarterGui ou StarterPlayerScripts).

Configurações Principais
No topo do script, você pode ajustar a paleta de cores no dicionário Cores:

Fundo: Cor principal da janela.

AzulChave: Cor de destaque para notificações de sistema.

VermelhoErro: Cor de destaque para alertas de manutenção.

Atalhos
Tecla Z: Abre e fecha o painel principal.

Botão X: Fecha a interface com animação de fade-out.
