%% -*- erlang-indent-level: 4;indent-tabs-mode: nil -*-
-module(exodemo_beep).

-export(['beep'/1]).

-include_lib("lager/include/log.hrl").

-define(CFG_INTERVAL, <<"config*interval">>).


'beep'(Duration) ->
    ?debug("beep:Duration(~p)~n", [Duration]),
    ok.
