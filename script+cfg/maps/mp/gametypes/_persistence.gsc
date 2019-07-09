init()
{ 
	level.persistentDataInfo = [];

	if(!level.ex_rank_stock) maps\mp\gametypes\_class::init();
	if(!level.ex_rank_stock) maps\mp\gametypes\_rank::init();
	if(!level.ex_rank_stock) maps\mp\gametypes\_missions::init(); 
	if(!level.ex_fullwarfare) maps\mp\gametypes\_dummy_missions::init(); 

	level thread onPlayerConnect();
}


onPlayerConnect()
{
	for(;;)
	{
		level waittill( "connected", player );

		player setClientDvar("ui_xpText", "1");
		player.enableText = true;
	}
}

// ==========================================
// Script persistent data functions
// These are made for convenience, so persistent data can be tracked by strings.
// They make use of code functions which are prototyped below.

/*
=============
statGet

Returns the value of the named stat
=============
*/
statGet( dataName )
{
	if ( !level.onlineGame )
		return 0;
	
	return self getStat( int(tableLookup( "mp/playerStatsTable.csv", 1, dataName, 0 )) );
}

/*
=============
setStat

Sets the value of the named stat
=============
*/
statSet( dataName, value )
{
	if ( !level.rankedMatch )
		return;
	
	self setStat( int(tableLookup( "mp/playerStatsTable.csv", 1, dataName, 0 )), value );	
}

/*
=============
statAdd

Adds the passed value to the value of the named stat
=============
*/
statAdd( dataName, value )
{	
	if ( !level.rankedMatch )
		return;

	curValue = self getStat( int(tableLookup( "mp/playerStatsTable.csv", 1, dataName, 0 )) );
	self setStat( int(tableLookup( "mp/playerStatsTable.csv", 1, dataName, 0 )), value + curValue );
}
