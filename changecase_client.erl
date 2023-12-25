-module(changecase_client).
-export([changecase/3]).

changecase(Server, Str, Command) ->
    Server ! {self(), {Str, Command}},
    receive
        {Server, ResultString} ->
            ResultString
    end.

% How to compile and run program:

% c(changecase_server).
% c(changecase_client).
% ChangeCaseServer = changecase_server:start().
% changecase_client:changecase(ChangeCaseServer, "browns", uppercase).
% "BROWNS"
% changecase_client:changecase(ChangeCaseServer, "BROWNS", lowercase).
% "browns"
