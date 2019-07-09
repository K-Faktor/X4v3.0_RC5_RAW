main()
{
	maps\mp\mp_strike_fx::main();
	maps\createart\mp_strike_art::main();
	maps\mp\_load::main();
	
	maps\mp\_compass::setupMiniMap("compass_map_mp_strike");

	if(level.ex_ambient_track) ambientPlay("ambient_strike_day");

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	setdvar("r_specularcolorscale", "1.86");
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setdvar("compassmaxrange","1900");

		if( getDvar("g_gametype") == "ctf")
	{	
		addobj("allied_flag", (-1574, -851, 8), (0, 0, 0));
		addobj("axis_flag", (1684, 2099, 16), (0, 0, 0));
	}
	
	if(getDvar("g_gametype") == "ctfb")
	{	
		addobj("allied_flag", (-1574, -851, 8), (0, 0, 0));
		addobj("axis_flag", (1684, 2099, 16), (0, 0, 0));
	}
}

addobj(name, origin, angles)
{
   ent = spawn("trigger_radius", origin, 0, 48, 148);
   ent.targetname = name;
   ent.angles = angles;
}
