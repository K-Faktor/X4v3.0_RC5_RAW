main()
{
	maps\mp\mp_showdown_fx::main();
	maps\createart\mp_showdown_art::main();
	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap("compass_map_mp_showdown");

	if(level.ex_ambient_track) ambientPlay("ambient_crossfire");

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	setdvar( "r_specularcolorscale", "1" );
	setdvar("compassmaxrange","2000");
	
	if( getDvar("g_gametype") == "ctf")
	{	
		addobj("allied_flag", (0, -1730, 16), (0, 0, 0));
		addobj("axis_flag", (-1, 1750, -2), (0, 0, 0));
	}

	if(getDvar("g_gametype") == "ctfb")
	{	
		addobj("allied_flag", (0, -1730, 16), (0, 0, 0));
		addobj("axis_flag", (-1, 1750, -2), (0, 0, 0));
	}
}

addobj(name, origin, angles)
{
   ent = spawn("trigger_radius", origin, 0, 48, 148);
   ent.targetname = name;
   ent.angles = angles;
}
