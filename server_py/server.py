import asyncio
import websockets

async def handler(websocket, path):
    count = 1
    while True:
        # Envia uma nova mensagem periodicamente
        await websocket.send(f"Mensagem {count} do servidor Python!")
        count += 1
        await asyncio.sleep(5)  # Aguarda 5 segundos antes de enviar a próxima mensagem

async def main():
    async with websockets.serve(handler, "172.20.200.163", 8765):
        print("Servidor WebSocket rodando em ws://172.20.200.163:8765")
        await asyncio.Future()  # Mantém o servidor ativo

# Rodar o servidor
asyncio.run(main())

