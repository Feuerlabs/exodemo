%% -*- erlang-indent-level: 4;indent-tabs-mode: nil -*-
-module(exodemo_beep).

-export(['beep'/1]).


'beep'(Duration) ->
    io:format("beep(~p)~n", [Duration]),
    ok.
