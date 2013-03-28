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

start_phase(ping, _, _) ->
    exoport:ping(),
    ok;

start_phase(hello, _, _) ->
    exodemo_hello:start_hello(),
    ok.

stop(_State) ->
    ok.
