main()
{
	maps\mp\mp_overgrown_fx::main();
	maps\createart\mp_overgrown_art::main();
	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap("compass_map_mp_overgrown");

	if(level.ex_ambient_track) ambientPlay("ambient_overgrown_day");

	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","2200");

	if( getDvar("g_gametype") == "ctf")
	{	
		addobj("allied_flag", (48, -3957, -164), (0, 0, 0));
		addobj("axis_flag", (43, 709, -171), (0, 0, 0));
	}
	
	if( getDvar("g_gametype") == "ctfb" )
	{	
		addobj("allied_flag", (48, -3957, -164), (0, 0, 0));
		addobj("axis_flag", (43, 709, -171), (0, 0, 0));
	}

}

addobj(name, origin, angles)
{
   ent = spawn("trigger_radius", origin, 0, 48, 148);
   ent.targetname = name;
   ent.angles = angles;
}
