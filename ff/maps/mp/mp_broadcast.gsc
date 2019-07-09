main()
{
	maps\mp\mp_broadcast_fx::main();
	maps\createart\mp_broadcast_art::main();
	maps\mp\_load::main();
	
	maps\mp\_compass::setupMiniMap("compass_map_mp_broadcast");
	
	if(level.ex_ambient_track) ambientPlay("ambient_broadcast_ext1");

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
	setdvar( "r_specularcolorscale", "1" );
	
	setdvar("compassmaxrange","1600");
	
	if( getDvar("g_gametype") == "ctf")
	{	
		addobj("allied_flag", (-2054, 3454, -61), (0, 0, 0));
		addobj("axis_flag", (1303, -259, -32), (0, 0, 0));
	}
	
	if(getDvar("g_gametype") == "ctfb")
	{	
		addobj("allied_flag", (-2054, 3454, -61), (0, 0, 0));
		addobj("axis_flag", (1303, -259, -32), (0, 0, 0));
	}
}

addobj(name, origin, angles)
{
   ent = spawn("trigger_radius", origin, 0, 48, 148);
   ent.targetname = name;
   ent.angles = angles;
}
