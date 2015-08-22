-module(task01).
-export([count_hi/1]).
-export([get_ten/0]).
-export([get_message/1]).

% 문자열에서 어느 단어가 나타는 횟수를 리턴하는 재귀 함수를 작성하라.
% 나는 hi라는 문자열을 찾도록 함
count_hi([]) -> 0;
count_hi([H|T]) -> count_hi(H,T).

count_hi(h,[H|T]) -> count_hi(h,H);
count_hi(h,$i) -> 1;
count_hi(h,N) -> 0;
count_hi($h,L) -> count_hi(h,L) + count_hi(L);
count_hi(H,T) -> count_hi(T).

% 10까지 세기 위해 재귀를 사용하는 함수를 작성하라.
get_ten() -> get_ten(0).

get_ten(10) -> 10;
get_ten(N) -> get_ten(N + 1).

% 패턴 매칭을 이용해 입력이 {error,Message}인지 succes인지에 따라
% 화면에 "success" 혹은 "error: message"를 출력하는 함수를 작성하라.
get_message(success) -> "success";
get_message({error,Message}) -> string:concat("error: ", Message).
