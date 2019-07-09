main()
{
	maps\mp\mp_bloc_fx::main();
	maps\createart\mp_bloc_art::main();
	maps\mp\_load::main();
	
	maps\mp\_compass::setupMiniMap("compass_map_mp_bloc");

	if(level.ex_ambient_track) ambientPlay("ambient_middleeast_ext");

	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	setdvar( "r_specularcolorscale", "1" );
	setdvar("compassmaxrange","2000");

	// raise up planes to avoid them flying through buildings
	level.airstrikeHeightScale = 1.8;

	if( getDvar("g_gametype") == "ctf")
	{	
		addobj("allied_flag", (4338, -6528, 0), (0, 0, 0));
		addobj("axis_flag", (-2781, -5405, 28), (0, 0, 0));
	}
	
	if(getDvar("g_gametype") == "ctfb")
	{	
		addobj("allied_flag", (4338, -6528, 0), (0, 0, 0));
		addobj("axis_flag", (-2781, -5405, 28), (0, 0, 0));
	}
}

addobj(name, origin, angles)
{
   ent = spawn("trigger_radius", origin, 0, 48, 148);
   ent.targetname = name;
   ent.angles = angles;
}
