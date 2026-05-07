#pragma semicolon 1
#include <sourcemod>

Handle emptyChangeMap = INVALID_HANDLE;
float lastDisconnectTime;
char g_strCampaignFirstMap[13][32];

#define RESTART_DELAY_EMPTY_SERVER 3.0

public void OnPluginStart()
{
	emptyChangeMap = CreateConVar("sv_emptychangemap", "1", "0|1");
	RegAdminCmd("sv_restart", RestartServer, ADMFLAG_ROOT);
}

// 服务器没人时自动刷新
public void OnClientDisconnect(int client)
{
	if (IsClientInGame(client) && IsFakeClient(client)) return;
	float currenttime = GetGameTime();
	if (lastDisconnectTime == currenttime) return;
	CreateTimer(RESTART_DELAY_EMPTY_SERVER, IsNobodyConnected, currenttime);
	lastDisconnectTime = currenttime;
}

public Action IsNobodyConnected(Handle timer, float timerDisconnectTime)
{
	if (timerDisconnectTime != lastDisconnectTime)
	{
		return Plugin_Stop;
	}
	for (int i = 1; i <= MaxClients; i++)
	{
		if (IsClientConnected(i) && !IsFakeClient(i))
		{
			return Plugin_Stop;
		}
	}
	if (GetConVarBool(emptyChangeMap))
	{
		ServerCommand("changelevel c2m1_highway");
	}
	return Plugin_Stop;
}

public Action RestartServer(int client, int args) {
	ServerCommand("sv_cheats 1;sv_crash;sv_cheats 0");
}
