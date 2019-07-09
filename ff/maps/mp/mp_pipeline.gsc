main()
{
	maps\mp\mp_pipeline_fx::main();
	maps\createart\mp_pipeline_art::main();
	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap("compass_map_mp_pipeline");

	if(level.ex_ambient_track) ambientPlay("ambient_pipeline");

	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setdvar("compassmaxrange","2200");
	
	if( getDvar("g_gametype") == "ctf")
	{	
		addobj("allied_flag", (-1189, -764, 264), (0, 0, 0));
		addobj("axis_flag", (32, 3152, -6), (0, 0, 0));
	}


	if(getDvar("g_gametype") == "ctfb")
	{	
		addobj("allied_flag", (-1216, -3020, 374), (0, 0, 0));
		addobj("axis_flag", (32, 3152, -6), (0, 0, 0));
	}
}

addobj(name, origin, angles)
{
   ent = spawn("trigger_radius", origin, 0, 48, 148);
   ent.targetname = name;
   ent.angles = angles;
}
