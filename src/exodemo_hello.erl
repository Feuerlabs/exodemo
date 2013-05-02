-module(exodemo_hello).
-behavior(gen_server).

-export([start_hello/0]).


-export([start_link/0,
	 init/1,
	 handle_call/3,
	 handle_cast/2,
	 handle_info/2,
	 terminate/2,
	 code_change/3]).

-record(st, {}).

-define(CFG_INTERVAL, <<"config*interval">>).

start_hello() ->
    io:format("exodemo_hello:start_hello()~n", []),
    gen_server:call(?MODULE, {start_hello}).


start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

init(_) ->
    io:format("exodemo_hello:init()~n"),
    {ok, #st{}}.

handle_cast(_, S) ->
    {noreply, S}.


handle_call({start_hello}, _From, _St) ->
    Intv = get_configured_interval(),
    io:format("exodemo_hello:handle_call(start_hello, ~p)~n", [Intv]),
    erlang:send_after(Intv, self(), { send_hello, Intv}),
    {reply, ok, #st { }};

handle_call(Msg, From, S) ->
    io:format("exodemo_hello:handle_call(~p, ~p, ~p)~n", [Msg, From, S]),
    {reply, error, S}.


handle_info({send_hello, Intv}, St) ->
    io:format("exodemo_hello:handle_info({send_hello, ~p}, ~p)~n",
	      [Intv, St]),
    exoport:rpc(exodm_rpc, rpc, [<<"exodemo">>, <<"hello">>,
				 [{'arg1', "world"}]]),

    erlang:send_after(Intv, self(), { send_hello, Intv}),
    { noreply, St };

handle_info(Msg, S) ->
    io:format("exodemo_hello:handle_info(?? ~p, ~p)~n", [Msg, S]),
    {noreply, S}.


terminate(_Reason, _S) ->
    ok.

code_change(_FromVsn, S, _Extra) ->
    {ok, S}.

get_configured_interval() ->
    case kvdb_conf:read(?CFG_INTERVAL) of
	{ ok, { _, _, I }} -> I;
	{ error, not_found } -> 10000
    end.

