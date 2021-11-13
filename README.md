# KFBossTraining

A mutator for the 2009 game [Killing Floor](https://en.wikipedia.org/wiki/Killing_Floor_(video_game)) which allows you
to practice the final wave against the Patriarch by immediately starting before the last wave with time to prepare for
the boss fight. All traders are unlocked for this purpose and all players start out with a balance of £10,000.

## Table of contents

- [Usage](#usage)
  - [Client](#client)
  - [Dedicated server](#dedicated-server)
- [Links](#links)

## Usage

To use KFBossTraining first navigate to the latest release and download the two files `KFBossTraining.u` and
`KFBossTraining.ucl`. Follow the below steps depending on whether you are playing Killing Floor Solo/using Host Game
or are using a dedicated server.

### Client

Simply drop the downloaded files into the `System` directory of your Killing Floor installation. The location of the
installation directory may vary depending on the operating system you use:

- Windows: `C:\Program Files (x86)\Steam\steamapps\common\KillingFloor`
- Linux: `~/.local/share/Steam/steamapps/common/KillingFloor`

You are done after moving the files to the `System` directory. Now you can simply select the "Boss Training" game mode
when starting a new round. Other players that may wish to join when using Host Game are not required to install the
mutator themselves.

### Dedicated server

Either add the mutator to `KillingFloor.ini` or change the command used to launch your dedicated server to include
`?Mutator=KFBossTraining.KFBossTraining`. Please check your preferred search engine for more accurate instructions
regarding the usage with dedicated servers.

## Development

The mutator is currently not very configurable. To change some aspects such as the money given to each player at the
start or the preparation time before the boss wave starts you might want to directly change the mutator. This requires
the Killing Floor SDK which can be installed via Steam. Clone KFBossTraining into your Killing Floor installation
directory and edit `System/KillingFloor.ini` to include the mutator during compilation. The `Makefile` can be used to
build the mutator. For more detailed instructions the link below may be helpful.

## Links

- [[Tutorial] Creating a Basic Mutator](https://forums.tripwireinteractive.com/index.php?threads/tutorial-creating-a-basic-mutator.44494/)
  as a starting point for developing your own Killing Floor 1 mutator.
