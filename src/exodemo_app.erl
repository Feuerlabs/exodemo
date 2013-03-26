-module(exodemo_app).

-behaviour(application).

%% Application callbacks
-export([start/2,
	 start_phase/3,
	 stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    exodemo_sup:start_link().

start_phase(alarms, _, _) ->
    exodemo_alarms:read_config(),
    ok;
start_phase(logging, _, _) ->
    exodemo_log:read_config(),
    ok;
start_phase(ping, _, _) ->
    exoport:ping(),
    ok;
start_phase(can, _, _) ->
    exodemo_can:start_can(),
    ok;
start_phase(waypoints, _, _) ->
    exodemo_waypoints:start_waypoints("/dev/ttySAC1"),
    ok.

stop(_State) ->
    ok.