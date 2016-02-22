%%%-------------------------------------------------------------------
%% @doc lager_test public API
%% @end
%%%-------------------------------------------------------------------

-module(lager_test).

%% Application callbacks
-export([start/0
        , stop/0]).

%%====================================================================
%% API
%%====================================================================

start()->
    ok = lager:start(),
    lager:info("started/0"),
    start(normal, []). 

start(_StartType, _StartArgs) ->
    lager:info([{event, <<"started">>}, {{count, "badarg"}, 1}], "failed to parse: ~p", [daaafafff]),
    lager_test_sup:start_link().

%%--------------------------------------------------------------------
stop()->
    ok = lager:clear_all_sinks(),
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
