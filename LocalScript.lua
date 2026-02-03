local uis = game:GetService("UserInputService"); local plrs = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local twn = game:GetService("TweenService")
local usr = plrs.LocalPlayer
local pGui = usr:WaitForChild("PlayerGui")
local req = RS:WaitForChild("GlobalSystemEvent")

local Cores = {
	Fundo = Color3.fromRGB(18, 18, 22),
	topo_bg = Color3.fromRGB(25, 25, 30),
	AzulChave = Color3.fromRGB(0, 160, 255),
	Vermelho = Color3.fromRGB(255, 60, 60),
	TxtBranco = Color3.fromRGB(240, 240, 240),
	Cinza = Color3.fromRGB(140, 140, 150),
	input_bg = Color3.fromRGB(28, 28, 35)
}

local tela = Instance.new("ScreenGui"); tela.Name = "Painel_Notificação_DessavezfoiXD"; tela.IgnoreGuiInset = true
tela.DisplayOrder = 9999; tela.ResetOnSpawn = false; tela.Parent = pGui

local grp = Instance.new("CanvasGroup"); grp.Name = "MainFrame_Bugado"; grp.Size = UDim2.new(0, 450, 0, 350)
grp.Position = UDim2.new(0.5, 0, 0.5, 0); grp.AnchorPoint = Vector2.new(0.5, 0.5); grp.BackgroundColor3 = Cores.Fundo
grp.BorderSizePixel = 0; grp.Visible = false; grp.GroupTransparency = 1; grp.Parent = tela

local borda_arred = Instance.new("UICorner"); borda_arred.CornerRadius = UDim.new(0, 10); borda_arred.Parent = grp

local sombra_img = Instance.new("ImageLabel"); sombra_img.AnchorPoint = Vector2.new(0.5, 0.5)
sombra_img.BackgroundTransparency = 1; sombra_img.Position = UDim2.new(0.5, 0, 0.5, 0)
sombra_img.Size = UDim2.new(1, 45, 1, 45); sombra_img.Image = "rbxassetid://1316045217"
sombra_img.ImageColor3 = Color3.new(0,0,0); sombra_img.ImageTransparency = 0.4; sombra_img.ZIndex = 0; sombra_img.Parent = grp

local header_top = Instance.new("Frame"); header_top.Size = UDim2.new(1, 0, 0, 40)
header_top.BackgroundColor3 = Cores.topo_bg; header_top.BorderSizePixel = 0; header_top.Parent = grp
Instance.new("UICorner", header_top).CornerRadius = UDim.new(0, 10)

local fix_visual = Instance.new("Frame"); fix_visual.Size = UDim2.new(1,0,0,10); fix_visual.Position = UDim2.new(0,0,1,-10)
fix_visual.BackgroundColor3 = Cores.topo_bg; fix_visual.BorderSizePixel=0; fix_visual.Parent = header_top

local lbl_tit = Instance.new("TextLabel"); lbl_tit.Size = UDim2.new(1, -50, 1, 0)
lbl_tit.Position = UDim2.new(0, 15, 0, 0); lbl_tit.BackgroundTransparency = 1
lbl_tit.Text = "Painel Mensagem + Update"; lbl_tit.TextColor3 = Cores.TxtBranco
lbl_tit.Font = Enum.Font.GothamBold; lbl_tit.TextSize = 14; lbl_tit.TextXAlignment = Enum.TextXAlignment.Left; lbl_tit.Parent = header_top

local btn_fecha = Instance.new("TextButton"); btn_fecha.Size = UDim2.new(0, 40, 1, 0)
btn_fecha.Position = UDim2.new(1, -40, 0, 0); btn_fecha.BackgroundTransparency = 1
btn_fecha.Text = "X"; btn_fecha.TextColor3 = Cores.CinzaMtoLoko; btn_fecha.Font = Enum.Font.GothamBlack
btn_fecha.TextSize = 18; btn_fecha.Parent = header_top

local abas_holder = Instance.new("Frame"); abas_holder.Size = UDim2.new(1, -30, 0, 45)
abas_holder.Position = UDim2.new(0, 15, 0, 55); abas_holder.BackgroundTransparency = 1; abas_holder.Parent = grp

local function cria_btn_aba(nm, txt, pos)
	local b = Instance.new("TextButton"); b.Name = nm; b.Size = UDim2.new(0.5, -5, 1, 0)
	b.Position = pos; b.BackgroundColor3 = Cores.input_bg; b.Text = txt
	b.Font = Enum.Font.GothamBold; b.TextColor3 = Cores.CinzaMtoLoko; b.TextSize = 13
	b.BorderSizePixel = 0; b.Parent = abas_holder
	Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
	return b
end

local btn_aviso = cria_btn_aba("TabA", "NOTIFICAÇÃO", UDim2.new(0,0,0,0))
local btn_updt = cria_btn_aba("TabU", "MANUTENÇÃO", UDim2.new(0.5,5,0,0))

local inp_area = Instance.new("Frame"); inp_area.Size = UDim2.new(1, -30, 0, 130)
inp_area.Position = UDim2.new(0, 15, 0, 115); inp_area.BackgroundTransparency = 1; inp_area.Parent = grp

local function arruma_input(obj)
	obj.BackgroundColor3 = Cores.input_bg; obj.TextColor3 = Cores.TxtBranco
	obj.PlaceholderColor3 = Cores.CinzaMtoLoko; obj.Font = Enum.Font.Gotham
	obj.TextSize = 14; obj.BorderSizePixel = 0; obj.ClearTextOnFocus = false
	obj.Text = ""; Instance.new("UICorner", obj).CornerRadius = UDim.new(0, 8)
	local pading = Instance.new("UIPadding", obj)
	pading.PaddingLeft = UDim.new(0, 12); pading.PaddingRight = UDim.new(0, 12); pading.PaddingTop = UDim.new(0, 12)
end

local txt_aviso = Instance.new("TextBox"); txt_aviso.Size = UDim2.new(1,0,1,0)
txt_aviso.PlaceholderText = "Texto do aviso..."; txt_aviso.TextWrapped = true
txt_aviso.TextYAlignment = Enum.TextYAlignment.Top; txt_aviso.Visible = true
arruma_input(txt_aviso); txt_aviso.Parent = inp_area

local tit_updt = Instance.new("TextBox"); tit_updt.Size = UDim2.new(1,0,0,60)
tit_updt.PlaceholderText = "Titulo do Update"; tit_updt.Visible = false
arruma_input(tit_updt); tit_updt.Parent = inp_area

local time_updt = Instance.new("TextBox"); time_updt.Size = UDim2.new(1,0,0,60)
time_updt.Position = UDim2.new(0,0,0,70); time_updt.PlaceholderText = "Tempo (ex: 60 ou 1h 2m)"
time_updt.Visible = false; arruma_input(time_updt); time_updt.Parent = inp_area

local btn_send = Instance.new("TextButton"); btn_send.Name = "BtnEnviaCarai"
btn_send.Size = UDim2.new(1, -30, 0, 50); btn_send.Position = UDim2.new(0, 15, 1, -65)
btn_send.BackgroundColor3 = Cores.AzulChave; btn_send.Text = "ENVIAR"
btn_send.Font = Enum.Font.GothamBold; btn_send.TextColor3 = Color3.new(1, 1, 1)
btn_send.TextSize = 14; btn_send.Parent = grp
Instance.new("UICorner", btn_send).CornerRadius = UDim.new(0, 8)

local aba_atv = "A"
local function refresh_ui()
	local eh_aviso = (aba_atv == "A")
	twn:Create(btn_aviso, TweenInfo.new(0.2), {BackgroundColor3=eh_aviso and Cores.AzulChave or Cores.input_bg, TextColor3=eh_aviso and Color3.new(1,1,1) or Cores.CinzaMtoLoko}):Play()
	twn:Create(btn_updt, TweenInfo.new(0.2), {BackgroundColor3=not eh_aviso and Cores.VermelhoErro or Cores.input_bg, TextColor3=not eh_aviso and Color3.new(1,1,1) or Cores.CinzaMtoLoko}):Play()

	txt_aviso.Visible = eh_aviso
	tit_updt.Visible = not eh_aviso
	time_updt.Visible = not eh_aviso

	twn:Create(btn_send, TweenInfo.new(0.2), {BackgroundColor3=eh_aviso and Cores.AzulChave or Cores.VermelhoErro}):Play()


end

btn_aviso.MouseButton1Click:Connect(function() aba_atv="A"; refresh_ui() end)
btn_updt.MouseButton1Click:Connect(function() aba_atv="U"; refresh_ui() end)

local travado = false
local function toggle_painel(forca_estado)
	if travado then return end
	local alvo = forca_estado
	if alvo == nil then alvo = not grp.Visible end
	travado = true

	if alvo then
		grp.Visible = true; grp.GroupTransparency = 1
		aba_atv = "A"; refresh_ui()
		twn:Create(grp, TweenInfo.new(0.25), {GroupTransparency = 0}):Play()
		task.wait(0.25)
	else
		local sumir = twn:Create(grp, TweenInfo.new(0.2), {GroupTransparency = 1})
		sumir:Play(); sumir.Completed:Wait()
		grp.Visible = false
	end
	travado = false


end

local drag, d_start, p_start = false, nil, nil
header_top.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag=true; d_start=i.Position; p_start=grp.Position end end)
uis.InputChanged:Connect(function(i) if drag and i.UserInputType == Enum.UserInputType.MouseMovement then local d = i.Position - d_start; grp.Position = UDim2.new(p_start.X.Scale, p_start.X.Offset + d.X, p_start.Y.Scale, p_start.Y.Offset + d.Y) end end)
uis.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag=false end end)

btn_fecha.MouseButton1Click:Connect(function() toggle_painel(false) end)

local function notifica_tela(txt, cor)
	local f = Instance.new("Frame"); f.Size = UDim2.new(0,400,0,60); f.Position = UDim2.new(0.5,-200,0,-90)
	f.BackgroundColor3 = Cores.topo_bg; f.BorderSizePixel = 0; f.Parent = tela
	Instance.new("UICorner", f); local s = Instance.new("UIStroke", f); s.Color = cor or Cores.AzulChave; s.Thickness = 2

	local l = Instance.new("TextLabel"); l.Size = UDim2.new(1,-30,1,0); l.Position = UDim2.new(0,15,0,0)
	l.BackgroundTransparency = 1; l.Text = txt; l.TextColor3 = Color3.new(1,1,1); l.Font = Enum.Font.GothamMedium
	l.TextSize = 14; l.RichText = true; l.TextWrapped = true; l.Parent = f

	twn:Create(f, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Position = UDim2.new(0.5,-200,0,50)}):Play()
	return f


end

btn_send.MouseButton1Click:Connect(function()
	if aba_atv == "A" and txt_aviso.Text ~= "" then
		print("enviando aviso...")
		req:FireServer("Aviso", txt_aviso.Text)
		txt_aviso.Text = ""; toggle_painel(false)
	elseif aba_atv == "U" then
		local raw_t = time_updt.Text
		print("raw time:", raw_t)

		local h = tonumber(raw_t:match("(%d+)h")) or 0
		local m = tonumber(raw_t:match("(%d+)m")) or 0
		local s = tonumber(raw_t:match("(%d+)s")) or 0
		local tot = (h*3600) + (m*60) + s

		if tot == 0 then
			tot = tonumber(raw_t) or 0
		end

		if tot > 0 then
			print("mandando update pro server... sec:", tot)
			req:FireServer("Update", {Title = tit_updt.Text, TotalSeconds = tot})
			tit_updt.Text = ""; time_updt.Text = ""; toggle_painel(false)
		else
			warn("tempo invalido irmao")
		end
	end


end)

req.OnClientEvent:Connect(function(act, data)
	if act == "AbrirPainel" then
		toggle_painel()
	elseif act == "ReceberAviso" then
		local pop = notifica_tela("<b>SISTEMA:</b> "..data.Msg.."\n<font color='#999' size='11'>De: "..data.Sender.."</font>")
		task.delay(6, function()
			if pop then
				twn:Create(pop, TweenInfo.new(0.3), {Position=UDim2.new(0.5,-200,0,-90)}):Play()
				task.wait(0.3); pop:Destroy()
			end
		end)
	elseif act == "ReceberUpdate" then
		task.spawn(function()
			local pop = notifica_tela("", Cores.VermelhoErro); local l = pop:FindFirstChildWhichIsA("TextLabel")
			for i = data.TotalSeconds, 0, -1 do
				if not pop or not pop.Parent then break end
				local _m, _s = math.floor(i/60), i%60
				l.Text = string.format("<b>MANUTENÇÃO: %s</b>\nReinicia em: <font color='#F44'>%02d:%02d</font>", data.Title:upper(), _m, _s)
				task.wait(1)
			end
			if pop then pop:Destroy() end
		end)
	end
end)

uis.InputBegan:Connect(function(io, gp)
	if not gp and io.KeyCode == Enum.KeyCode.Z then toggle_painel() end
end)

-- Obrigado por ver esté codigo ❤️
