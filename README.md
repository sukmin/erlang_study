# erlang_study

### mac에 얼랭 개발환경 설정
```
먼저 openssl 을 먼저 설치하자.
(맥에 디폴트로 설치되어있는데 이걸 쓰면 --with-ssl 설정이 정상적으로 먹지 않았다.)

http://www.openssl.org/source/    여기서 설치하고싶은 버전을 받는다.
압축을 풀고 압축을 푼 디렉토리로 들어가서 아래 명령어를 순차적으로 친다.

./Configure darwin64-x86_64-cc
make
sudo make install

그러면 /usr/local/ssl/ 요 경로 밑에 설치된 것을 확인할 수 있다.

그 다음 얼랭사이트에서 얼랭소스를 받자.


./configure --with-ssl --with-ssl=/usr/local/ssl --with-javac
( http://www.erlang.org/doc/installation_guide/INSTALL.html 여기서 설정을 확인해서 추가하고 싶은 옵션이 있으면 추가하자 )
make
sudo make install

그 다음 빌드 툴은 rebar 설치

git clone https://github.com/rebar/rebar.git
적절하게 git으로 땡겨와서 ./bootstrap 을 실행시키자.

rebar는 erlang 설치할때 openssl 옵션 안줬으면 설치안될 수도 있다.


인텔리j 기본 구성은 아래 url을 참고할 것
https://www.jetbrains.com/idea/help/getting-started-with-erlang.html
```

### 브루스 테이트의 세븐 랭귀지 1일차 자율학습
http://me2.do/Fi6E7wCn

소감 : 더 간단하게도 구현가능해보이는데, 일단은 여기까지 ㅠㅠ

### 브루스 테이트의 세븐 랭귀지 2일차 자율학습
http://me2.do/xLOEtLQN

소감 : 틱택토를 더 스마트하게 만들 수 있을꺼 같은데.. 일단 o가 성공하는 경우, x가 성공하는 모든 경우를 보도록 구현했다.
