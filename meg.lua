print("IT IS MEGALADON")
								local v2 = require(game.ReplicatedStorage.Modules.Lightning);
								local v3 = require(game.ReplicatedStorage.Modules.Xeno);
								local v4 = require(game.ReplicatedStorage.Modules.CameraShaker);
								local l__ReplicatedStorage__1 = game.ReplicatedStorage;
								local l__Debris__2 = game.Debris;
								local u3 = require(game.ReplicatedStorage.Modules.Raycast);
								local l__TweenService__4 = game.TweenService;
								local function RunStompFx(p1, p2, p3, p4, p5)
									local v5 = l__ReplicatedStorage__1.KillFX.Megalodon.Megalodon:Clone();
									local v6 = l__ReplicatedStorage__1.KillFX[p1].Stomp:Clone();
									v6.Parent = v5["shark original"];
									local v7 = math.random(-360, 360);
									game.Debris:AddItem(v5, 8);
									v5.Parent = workspace.Ignored.Animations;
									local v8 = v5.AnimationController:LoadAnimation(v5["shark original"].Animation);
									v5.HumanoidRootPart.CFrame = CFrame.new(p2.Parent.LowerTorso.Position) * CFrame.Angles(-1.5707963267948966, -0, (math.rad(-50 + v7)));
									local v9 = l__ReplicatedStorage__1.KillFX.Megalodon.Puddle:Clone();
									game.Debris:AddItem(v9, 10);
									v9.Parent = workspace.Ignored.Animations;
									v9.Position = p2.Position;
									local v10 = game.TweenService:Create(v9, TweenInfo.new(1, Enum.EasingStyle.Quad), {
										Size = Vector3.new(528.925, 3.34, 398.834), 
										CFrame = CFrame.new(p2.Parent.LowerTorso.Position) * CFrame.new(0, 0, 100) * CFrame.Angles(-0, math.rad(-360 + v7), -0)
									});
									v10:Play();
									v10.Completed:Wait();
									v8:Play();
									local function u5(p6)
										local v11 = Instance.new("Attachment", workspace.Terrain);
										v11.WorldPosition = p6;
										l__Debris__2:AddItem(v11, 12);
										for v12, v13 in pairs(game:GetService("ReplicatedStorage").KillFX.Megalodon.Splashy:GetDescendants()) do
											if v13:IsA("ParticleEmitter") then
												local v14 = v13:Clone();
												v14.Parent = v11;
												v14:Emit(v14:GetAttribute("EmitCount"));
											end;
										end;
									end;
									local l__Position__6 = p2.Parent.LowerTorso.Position;
									task.spawn(function()
										local v15 = {
											FirstYield = 0.235, 
											SecondYield = 0.85
										};
										task.wait(v15.FirstYield);
										local v16, v17 = u3({ v5["shark original"].Bone.WorldPosition, Vector3.new(0, -1, 0) * 1000000, { workspace.Ignored, v5, game.Players.LocalPlayer } });
										if v17 ~= nil then
											u5(v17);
										end;
										task.wait(v15.SecondYield);
										local v18, v19 = u3({ v5["shark original"].Bone.WorldPosition, Vector3.new(0, -1, 0) * 1000000, { workspace.Ignored, v5, game.Players.LocalPlayer } });
										if v19 ~= nil then
											u5(v19);
											local v20 = l__ReplicatedStorage__1.KillFX.Megalodon.Puddle:Clone();
											v20.Position = v19;
											v20.Size = Vector3.zero;
											v20.Parent = workspace.Ignored;
											l__TweenService__4:Create(v20, TweenInfo.new(0.85), {
												Size = Vector3.new(122, 2.5, 122)
											}):Play();
											l__Debris__2:AddItem(v20, 10);
											local u7 = nil;
											u7 = v8:GetMarkerReachedSignal("END"):Connect(function()
												l__TweenService__4:Create(v20, TweenInfo.new(2.5), {
													Transparency = 1, 
													Size = Vector3.zero, 
													Position = l__Position__6
												}):Play();
												u7:Disconnect();
											end);
										end;
									end);
									local u8 = 0;
									local u9 = nil;
									u9 = v8:GetMarkerReachedSignal("START"):Connect(function()
										local v21 = v5["shark original"]:FindFirstChildOfClass("BodyPosition");
										v21.Parent = p2.Parent.UpperTorso;
										--p5[1](v21);
										coroutine.wrap(function()
											while true do
												v21.Position = v5["shark original"].Pos.WorldPosition;
												task.wait();
												if v5.Parent == nil then
													break;
												end;
												if v21.Parent == nil then
													break;
												end;			
											end;
											if v21.Parent ~= nil then
												v21:Destroy();
											end;
										end)();
										v6:Play();
										game.Debris:AddItem(v6, 4);
										task.delay(3, function()
											game.TweenService:Create(v6, TweenInfo.new(1), {
												Volume = 0
											}):Play();
										end);
										v5["shark original"].Transparency = 0.5;
										local u10 = nil;
										u10 = v8:GetMarkerReachedSignal("PUDDLE"):Connect(function()
											if u8 == 0 then
												local v22 = l__ReplicatedStorage__1.KillFX.Megalodon.Water:Clone();
												v22.CFrame = v9.First.WorldCFrame;
												v22.Parent = workspace.Ignored.Animations;
												game.Debris:AddItem(v22, 3);
												v22.Sound1:Play();
												u8 = u8 + 1;
												return;
											end;
											local v23 = l__ReplicatedStorage__1.KillFX.Megalodon.Water:Clone();
											v23.CFrame = v9.Second.WorldCFrame;
											v23.Parent = workspace.Ignored.Animations;
											game.Debris:AddItem(v23, 3);
											v23.Sound:Play();
											u10:Disconnect();
										end);
										local u11 = nil;
										u11 = v8:GetMarkerReachedSignal("END"):Connect(function()
											game.TweenService:Create(v5["shark original"], TweenInfo.new(1), {
												Transparency = 1
											}):Play();
											task.delay(1.5, function()
												game.TweenService:Create(v9, TweenInfo.new(1), {
													Transparency = 1, 
													Size = Vector3.new(0, 0, 0), 
													Position = l__Position__6
												}):Play();
											end);
											u11:Disconnect();
										end);
										u9:Disconnect();
									end);
									return nil;
								end;
								RunStompFx(getgenv().StompEffect, getgenv().vCharHRP, getgenv().VictimPlayer, getgenv().LocalPlayer, (0))
