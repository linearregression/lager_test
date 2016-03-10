%%%-------------------------------------------------------------------
%% @doc lager_test public API
%% @end
%%%-------------------------------------------------------------------

-module(lager_test_app).

-behaviour(application).

%% Application callbacks
-export([start/0, start/2
        , stop/0, stop/1]).

-define(APPLICATION, lager_test).

%%====================================================================
%% API
%%====================================================================

start()->
    lager:start(),
    lager:info("started/0"),
    application:start(?MODULE). 

start(_StartType, _StartArgs) ->
    lager:info([{event, <<"started">>}], "Wawawawawa sing: ~s", [<<"daaafafff">>]),
    ok = exometer:register_application(?APPLICATION),
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
