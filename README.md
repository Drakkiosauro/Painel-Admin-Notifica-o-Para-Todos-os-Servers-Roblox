# Painel-Admin-Notifica-o-Para-Todos-os-Servers-Roblox

Interface administrativa para envio de notificações globais e alertas de manutenção com contagem regressiva no Roblox.

Permite que administradores enviem mensagens importantes para todos os jogadores em tempo real, com suporte a duas abas: notificações comuns e alertas de manutenção com timer.

## Funcionalidades

- Interface com duas abas:
  - **Notificação** – envio de mensagens gerais
  - **Manutenção** – alertas com título + contagem regressiva
- Suporte a formatos de tempo flexíveis (ex: `1h`, `30m`, `120s`, `2h15m`, ou apenas segundos)
- Animações suaves com TweenService (fade, hover, slide)
- Janela arrastável pelo cabeçalho
- Atalhos de teclado:
  - **Z** → abre/fecha o painel
- Notificações flutuantes no topo da tela para avisos recebidos
- Contagem regressiva visual para manutenções (atualiza a cada segundo)

## Requisitos

- **LocalScript** rodando no client `StarterPlayerScripts`
- **Script** dentro do `ServerScriptService`
