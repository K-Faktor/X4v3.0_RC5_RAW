main()
{
	maps\mp\mp_carentan_fx::main();
	maps\createart\mp_carentan_art::main();

	// This places fx on the lamp prefabs, it's commented out since the fx have been hard coded for shipping. 
	// The script is left as an example.
	//level thread maps\mp\mp_carentan_fx::placeGlows();

	maps\mp\_load::main();
	maps\mp\_compass::setupMiniMap("compass_map_mp_carentan");
	
	// raise up planes to avoid them flying through buildings
	level.airstrikeHeightScale = 1.4;
	
	setExpFog(500, 3500, .5, 0.5, 0.45, 0);
	if(level.ex_ambient_track) ambientPlay("ambient_carentan_ext0");

	
	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "urban";
	game["axis_soldiertype"] = "urban";

	if( getDvar("g_gametype") == "ctf")
	{	
		addobj("allied_flag", (1545, 1516, -32), (0, 0, 0));
		addobj("axis_flag", (1281, 3790, -24), (0, 0, 0));
	}
	
	if(getDvar("g_gametype") == "ctfb")
	{	
		addobj("allied_flag", (1545, 1516, -32), (0, 0, 0));
		addobj("axis_flag", (1281, 3790, -24), (0, 0, 0));
	}
}

addobj(name, origin, angles)
{
   ent = spawn("trigger_radius", origin, 0, 48, 148);
   ent.targetname = name;
   ent.angles = angles;
}


