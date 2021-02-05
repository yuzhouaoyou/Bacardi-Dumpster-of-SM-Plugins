#include <sourcemod>

#pragma semicolon 1
#pragma newdecls required

#define PLUGIN_VERSION "1.0"

public Plugin myinfo = 
{
	name = "禁止添加bot",
	author = "宇宙遨游",
	description = "nobots",
	version = PLUGIN_VERSION,
	url = "www.wssr.top"
};

public void OnPluginStart()
{
	HookEvent("player_spawn", event_playerSpawn);
}

Action event_playerSpawn(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(event.GetInt("userid"));
	if (IsBot(client))KickClient(client);
}

stock bool IsBot(int client)
{
	return IsFakeClient(client) && !IsClientSourceTV(client) && !IsClientReplay(client);
}