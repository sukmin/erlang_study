-module(task02).
-export([get_description/2]).
-export([get_total_price/1]).
-export([tic_tac_to/1]).

% [{erlang,"a functional language"},{ruby, "an OO language"}]처럼
% 키워드와 값으로 이루어진 튜플을 담은 리스트를 생각해보라.
% 이러한 리스트와 하나의 키워드를 인수로 받아들인 다음 해당 키워드와
% 묶여 있는 값을 리턴하는 함수를 작성하라.
% 입력파라미터 : [{erlang,"a functional language"},{ruby, "an OO language"}]
get_description(List,Target) ->
  lists:filter( fun({Keyword,_}) ->
    case Target of
      Keyword -> true;
      _ -> false
    end end , List ).

% [{item, quantity, price},...] 같은 내용을 담고 있느 쇼핑 리스트가 있다고 하자.
% total_price가 quantity에 price를 곱한 값을 의미한다고 할 때,
% items 리스트를 [{item, total_price}, ...]의 형태로 생성하는
% 리스트 컴프리헨션 코드를 작성하라.
% 입력파라미터 : [{apple,10,3000},{banana,1000,2},{cherry,10,99}]
get_total_price(List) ->
  [ { Item , Quantity * Price } || { Item , Quantity, Price } <- List ].

% 보너스 문제 : 틱택토 보드를 리스트나 혹은 9개의 요소를 갖는 튜플로 받아들이는 프로그램을 작성하라.
% 승자가 결정되면 승자(x 또는 o)를 리턴하고, 무승부면 cat을 리턴하고, 게임이 계속 진행될 수 있지만
% 아직 승자가 결정되지 않은 상태라면 no_winner를 리턴하라.
% 틱태토란? -> https://namu.wiki/w/%ED%8B%B1%ED%83%9D%ED%86%A0
% 입력파라미터 o승 : [o,x,o,
%                 x,o,x,
%                 o,x,o]
% [o,x,o,x,o,x,o,x,o]
% 입력파라미터 x승 : [x,x,x,
%                 o,o,e,
%                 e,e,e]
% [x,x,x,o,o,e,e,e,e]
% 입력파라미터 무승부 : [x,x,o,
%                   o,o,x,
%                   x,o,x]
% [x,x,o,o,o,x,x,o,x]
% 입력파라미터 진행가능 : [x,x,o,
%                    o,o,x,
%                    e,e,e]
% [x,x,o,o,o,x,e,e,e]
tic_tac_to([o,o,o,_,_,_,_,_,_]) -> o;
tic_tac_to([_,_,_,o,o,o,_,_,_]) -> o;
tic_tac_to([_,_,_,_,_,_,o,o,o]) -> o;
tic_tac_to([o,_,_,o,_,_,o,_,_]) -> o;
tic_tac_to([_,o,_,_,o,_,_,o,_]) -> o;
tic_tac_to([_,_,o,_,_,o,_,_,o]) -> o;
tic_tac_to([o,_,_,_,o,_,_,_,o]) -> o;
tic_tac_to([_,_,o,_,o,_,o,_,_]) -> o;
tic_tac_to([x,x,x,_,_,_,_,_,_]) -> x;
tic_tac_to([_,_,_,x,x,x,_,_,_]) -> x;
tic_tac_to([_,_,_,_,_,_,x,x,x]) -> x;
tic_tac_to([x,_,_,x,_,_,x,_,_]) -> x;
tic_tac_to([_,x,_,_,x,_,_,x,_]) -> x;
tic_tac_to([_,_,x,_,_,x,_,_,x]) -> x;
tic_tac_to([x,_,_,_,x,_,_,_,x]) -> x;
tic_tac_to([_,_,x,_,x,_,x,_,_]) -> x;
tic_tac_to([]) -> cat;
tic_tac_to([e|_]) -> no_winner;
tic_tac_to([_|T]) -> tic_tac_to(T).
