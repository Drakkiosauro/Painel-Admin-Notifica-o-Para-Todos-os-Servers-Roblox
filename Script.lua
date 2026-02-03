local RS = game:GetService("ReplicatedStorage") local Plrs = game:GetService("Players")
local ADMS = { SEUIDAQUI, }
local rem = RS:FindFirstChild("GlobalSystemEvent") if not rem then rem = Instance.new("RemoteEvent") rem.Name = "GlobalSystemEvent" rem.Parent = RS end
local function is_adm(p) return table.find(ADMS, p.UserId) end
Plrs.PlayerAdded:Connect(function(p) p.Chatted:Connect(function(msg) if msg:lower() == "/painel" and is_adm(p) then rem:FireClient(p, "AbrirPainel") end end) end)
rem.OnServerEvent:Connect(function(p, t, d) if not is_adm(p) then warn("Tentativa de exploit do: " .. p.Name) return end
	if t == "Aviso" then
		local m = tostring(d)
		if #m > 0 then
			rem:FireAllClients("ReceberAviso", {
				Msg = m,
				Sender = p.Name
			})
		end
	elseif t == "Update" and type(d) == "table" then
		local tit = tostring(d.Title)
		local sec = tonumber(d.TotalSeconds) or 0
		if sec > 0 then
			rem:FireAllClients("ReceberUpdate", {
				Title = #tit > 0 and tit or "Manutenção",
				TotalSeconds = sec,
				Sender = p.Name
			})
			task.delay(sec, function()
				for _, target in pairs(Plrs:GetPlayers()) do
					target:Kick("\n[UPDATE] " .. (tit ~= "" and tit or "Servidor Reiniciado") .. "\nAutor: " .. p.Name)
				end
			end)
		end
	end
end)
