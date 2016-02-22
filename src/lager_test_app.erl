%%%-------------------------------------------------------------------
%% @doc lager_test public API
%% @end
%%%-------------------------------------------------------------------

-module(lager_test_app).

-behaviour(application).

%% Application callbacks
-export([start/0, start/2
        , stop/0, stop/1]).

%%====================================================================
%% API
%%====================================================================

start()->
    lager:start(),
    lager:info("started/0"),
    application:start(?MODULE). 

start(_StartType, _StartArgs) ->
    lager:info([{event, <<"started">>}], "Wawawawawa sing: ~s", [<<"daaafafff">>]),
    lager_test_sup:start_link().

%%--------------------------------------------------------------------
stop()->
    ok = lager:clear_all_sinks(),
    application:stop(?MODULE). 

stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
