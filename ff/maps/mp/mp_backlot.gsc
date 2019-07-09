main()
{
	maps\mp\mp_backlot_fx::main();
	maps\createart\mp_backlot_art::main();
	maps\mp\_load::main();	
	
	maps\mp\_compass::setupMiniMap("compass_map_mp_backlot");

	if(level.ex_ambient_track) ambientPlay("ambient_backlot_ext");

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");

	if( getDvar("g_gametype") == "ctf")
	{
		addobj("allied_flag", (-486, 1998, 64), (0, 0, 0));
		addobj("axis_flag", (630, -2067, 64), (0, 0, 0));
	}
	
	if(getDvar("g_gametype") == "ctfb")
	{
		addobj("allied_flag", (-486, 1998, 64), (0, 0, 0));
		addobj("axis_flag", (630, -2067, 64), (0, 0, 0));
	}
}

addobj(name, origin, angles)
{
   ent = spawn("trigger_radius", origin, 0, 48, 148);
   ent.targetname = name;
   ent.angles = angles;
}
