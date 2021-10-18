class KFBossTraining extends KFGameType;

event PlayerController Login
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
}

event InitGame
(
    string Options,
    out string Error
)
{
    Super.InitGame(Options, Error);

    InitialWave = FinalWave;
}

state MatchInProgress
{
    function BeginState()
    {
        Super.BeginState();

        WaveCountDown = TimeBetweenWaves;
        OpenShops();
    }

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
    GameName    = "Boss Training";
    Description = "Boss training allows you and your team to practice fighting the Patriarch. Players spawn with a generous amount of starting cash and are able to prepare themselves before facing off the boss in a single battle without any preceeding rounds.";
}
