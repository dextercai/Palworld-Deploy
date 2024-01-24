# Palworld Server Deploy Resources

[![Docker Image](https://github.com/dextercai/Palworld-Deploy/actions/workflows/x86_build.yaml/badge.svg)](https://github.com/dextercai/Palworld-Deploy/actions/workflows/x86_build.yaml)

幻兽帕鲁服务端搭建

## x86 Image

服务端启动：`/home/steam/Steam/steamapps/common/PalServer/PalServer.sh`

默认配置位于：`/home/steam/Steam/steamapps/common/PalServer/DefaultPalWorldSettings.ini`

修改默认配置文件不会影响已经创建的世界，也不会影响后续创建的世界。

需要首次运行服务器后，关闭服务器。  

随后到 `/home/steam/Steam/steamapps/common/PalServer/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini` 进行修改。

> 根据Reddit上的帖子，若先修改配置文件，再重启服务器，会导致配置文件被恢复。

以下为默认配置文件内容（截至本文撰写时）。官方建议将文件拷贝后修改使用。并且请注意：OptionSettings这一行不允许有换行符。  

> We recommend that you copy the default settings to a configuration file and then change only the necessary settings.
Also, line breaks are not allowed in the middle of a line.

```
; This configuration file is a sample of the default server settings.
; Changes to this file will NOT be reflected on the server.
; To change the server settings, modify Pal/Saved/Config/LinuxServer/PalWorldSettings.ini.
[/Script/Pal.PalGameWorldSettings]
OptionSettings=(Difficulty=None,DayTimeSpeedRate=1.000000,NightTimeSpeedRate=1.000000,ExpRate=1.000000,PalCaptureRate=1.000000,PalSpawnNumRate=1.000000,PalDamageRateAttack=1.000000,PalDamageRateDefense=1.000000,PlayerDamageRateAttack=1.000000,PlayerDamageRateDefense=1.000000,PlayerStomachDecreaceRate=1.000000,PlayerStaminaDecreaceRate=1.000000,PlayerAutoHPRegeneRate=1.000000,PlayerAutoHpRegeneRateInSleep=1.000000,PalStomachDecreaceRate=1.000000,PalStaminaDecreaceRate=1.000000,PalAutoHPRegeneRate=1.000000,PalAutoHpRegeneRateInSleep=1.000000,BuildObjectDamageRate=1.000000,BuildObjectDeteriorationDamageRate=1.000000,CollectionDropRate=1.000000,CollectionObjectHpRate=1.000000,CollectionObjectRespawnSpeedRate=1.000000,EnemyDropItemRate=1.000000,DeathPenalty=All,bEnablePlayerToPlayerDamage=False,bEnableFriendlyFire=False,bEnableInvaderEnemy=True,bActiveUNKO=False,bEnableAimAssistPad=True,bEnableAimAssistKeyboard=False,DropItemMaxNum=3000,DropItemMaxNum_UNKO=100,BaseCampMaxNum=128,BaseCampWorkerMaxNum=15,DropItemAliveMaxHours=1.000000,bAutoResetGuildNoOnlinePlayers=False,AutoResetGuildTimeNoOnlinePlayers=72.000000,GuildPlayerMaxNum=20,PalEggDefaultHatchingTime=72.000000,WorkSpeedRate=1.000000,bIsMultiplay=False,bIsPvP=False,bCanPickupOtherGuildDeathPenaltyDrop=False,bEnableNonLoginPenalty=True,bEnableFastTravel=True,bIsStartLocationSelectByMap=True,bExistPlayerAfterLogout=False,bEnableDefenseOtherGuildPlayer=False,CoopPlayerMaxNum=4,ServerPlayerMaxNum=32,ServerName="Default Palworld Server",ServerDescription="",AdminPassword="",ServerPassword="",PublicPort=8211,PublicIP="",RCONEnabled=False,RCONPort=25575,Region="",bUseAuth=True,BanListURL="https://api.palworldgame.com/api/banlist.txt")
```
## 多线程优化

可在脚本启动时，添加`-useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS`参数，以启用多线程优化。  
根据官方手册，最大支持4线程的优化

> It is effective up to a maximum of about 4 threads, and allocating more than this number of threads does not make much sense.

## Helm Chart

本Helms Chart仅用于实验性质的单节点部署（多节点集群建议修改存档文件挂载方式），游戏存档文件使用挂载形式挂入容器内。同时不应该修改游戏内默认的端口配置，而是基于Service配置进行访问。

