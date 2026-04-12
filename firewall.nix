{ config, pkgs, ... }:
{

networking.firewall.enable = true;
	networking.firewall.allowedTCPPorts = [ 25565 ];
	networking.firewall.allowedUDPPorts = [ 25565 ];

}
