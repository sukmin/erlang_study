-module(translate).
-export([loop/0]).
-export([translate/2]).

loop() ->
  receive
    {From,"apple"} ->
      From ! "ios",
      loop();

    {From,"google"} ->
      From ! "android",
      loop();

    {From,_} ->
      From ! "I don't undertand.",
      loop()
  end.

translate(To,Word) ->
    To ! {self(),Word},
    receive
      Translation -> Translation
    end.
