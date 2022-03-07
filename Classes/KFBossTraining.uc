class KFBossTraining extends KFGameType;

/* event PlayerController Login
(
    string Portal,
    string Options,
    out string Error
)
{
    local PlayerController NewPlayer;
    NewPlayer = Super.Login(Portal, Options, Error);

    if (!NewPlayer.PlayerReplicationInfo.bOnlySpectator)
    {
        NewPlayer.PlayerReplicationInfo.Score = 10000;
    }
    return NewPlayer;
} */ //Use Default RespawnCash

event InitGame
(
    string Options,
    out string Error
)
{
    Super.InitGame(Options, Error);

    InitialWave = FinalWave;
}

// Change the trader path sign's Color; Cyan
function ShowPathTo(PlayerController P, int TeamNum)
{
    if( KFGameReplicationInfo(GameReplicationInfo).CurrentShop == none )
    {
        return;
    }

    KFGameReplicationInfo(GameReplicationInfo).CurrentShop.InitTeleports();

    if ( (KFGameReplicationInfo(GameReplicationInfo).CurrentShop.TelList[0] != None) &&
       (P.FindPathToward(KFGameReplicationInfo(GameReplicationInfo).CurrentShop.TelList[0], false) != None) )
    {
        Spawn(class'PatTrainWhisp', P,, P.Pawn.Location);
    }
}

state MatchInProgress
{   
    // Open traders at start
    function BeginState()
    {
        Super.BeginState();

        WaveCountDown = TimeBetweenWaves;
        OpenShops();
    }

    // Open all Traders
    function OpenShops()
    {
        local int i;

        for (i = 0; i < ShopList.Length; i++)
        {
            ShopList[i].bAlwaysEnabled = true;
        }
        Super.OpenShops();
    }
}


defaultProperties
{   
    StartingCash=10000
    MinRespawnCash=10000
    TimeBetweenWaves=120

    
    StartingCashBeginner=10000
    StartingCashNormal=10000
    StartingCashHard=10000
    StartingCashSuicidal=10000
    StartingCashHell=10000

    MinRespawnCashBeginner=10000
    MinRespawnCashNormal=10000
    MinRespawnCashHard=10000
    MinRespawnCashSuicidal=10000
    MinRespawnCashHell=10000

    TimeBetweenWavesBeginner=120
    TimeBetweenWavesNormal=120
    TimeBetweenWavesHard=120
    TimeBetweenWavesSuicidal=120
    TimeBetweenWavesHell=120

    GameName    = "Boss Training";
    Description = "Boss training allows you and your team to practice fighting the Patriarch. Players spawn with a generous amount of starting cash and are able to prepare themselves before facing off the boss in a single battle without any preceeding rounds.";
}
