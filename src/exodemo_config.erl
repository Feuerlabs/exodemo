%% -*- erlang-indent-level: 4;indent-tabs-mode: nil -*-
-module(exodemo_config).

-export(['set-hello-interval'/1]).

-define(CFG_INTERVAL, <<"config*interval">>).


'set-hello-interval'(Interval) ->
    ?debug("set-hello-interval(~p)~n", [Interval]),
    kvdb_conf:write({?CFG_INTERVAL, [], Interval}),
    {notify, "exodemo:set-hello-interval-callback",
     [{'transaction-id', 1},
      {'status-code', 1},
      {'final', true}]}.
