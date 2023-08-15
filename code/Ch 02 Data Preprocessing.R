
# ----------------------------------------------------------------------------
# 데이터 전처리
# ----------------------------------------------------------------------------

# 파이프 연산자

# 관련 패키지를 호출합니다.
library(tidyverse)

# 벡터 원소별 빈도수를 확인합니다.
table(x = iris$Species)

# 벡터 원소별 상대도수를 확인합니다.
prop.table(x = table(x = iris$Species))

# 파이프 연산자를 사용하여 상대도수를 확인합니다.
iris$Species %>% table() %>% prop.table()


# dplyr 패키지 함수 사용 예제

# dplyr 패키지의 주요 기능을 실습합니다.
iris %>% 
  select(Sepal.Length, Species) %>% 
  filter(Sepal.Length >= 5.2) %>% 
  group_by(Species) %>% 
  summarise(Count = n()) %>% 
  mutate(Pcnt = Count / sum(Count)) %>% 
  arrange(desc(x = Pcnt))


# 열 선택 및 삭제

# apt에서 아파트, 거래금액 열을 선택합니다.
apt %>% select(아파트, 거래금액) %>% head()

# apt에서 8, 2번째 열을 선택합니다.
apt %>% select(8, 2) %>% tail()

# apt에서 일련번호 열을 삭제하고 apt에 재할당합니다.
apt %>% select(-일련번호) -> apt

# apt의 구조를 확인합니다.
str(object = apt)


# 열이름 변경

# apt에서 일부 열이름을 변경합니다.
apt %>% 
  rename(아파트명 = 아파트, 아파트주소 = 도로명주소) %>% 
  head()

# apt의 처음 6행을 출력합니다.
apt %>% head()


# 열별 자료형 변환

# apt의 열별 자료형을 확인합니다.
map_chr(.x = apt, .f = class)

# apt의 월을 문자형으로 변환합니다.
apt %>% mutate(월 = as.factor(x = 월)) -> apt

# apt의 구조를 확인합니다.
str(object = apt)


# 행 선택

# apt에서 거래금액이 60억 이상인 행을 선택합니다.
apt %>% filter(거래금액 >= 600000)

# apt에서 거래금액이 60억 미만이고, 60층 이상인 행을 선택합니다.
apt %>% filter(거래금액 < 600000, 층 >= 60)

# apt에서 1~5번 행을 선택합니다.
apt %>% slice(1:5)

# apt에서 1부터 10까지 홀수행만 선택합니다.
apt %>% slice(seq(from = 1, to = 10, by = 2))


# 파생변수 생성: 연속형 변수

# 거래금액을 전용면적으로 나눈 단위금액 열을 생성하고 apt에 재할당합니다.
apt %>% mutate(단위금액 = 거래금액 / 전용면적) -> apt

# 거래금액의 단위를 억원으로 변경, 단위금액에 3.3을 곱하고 apt에 재할당합니다.
apt %>% 
  mutate(거래금액 = 거래금액 / 10000,
         단위금액 = round(x = 단위금액 * 3.3, digits = 0)) -> apt

# apt의 처음 6행을 출력합니다.
head(x = apt)


# 파생변수 생성: 범주형 변수

# 단위금액이 1억 이상이면 '1억 이상', 아니면 '1억 미만'인 원소를 갖는 
# 금액구분 열을 생성하고 apt에 재할당합니다.
apt %>% 
  mutate(금액구분 = ifelse(test = 단위금액 >= 10000, 
                           yes = '1억 이상',
                           no = '1억 미만')) -> apt

# apt의 처음 6행을 출력합니다.
head(x = apt)


# 데이터프레임 정렬

# apt를 거래금액으로 오름차순 정렬합니다.
apt %>% arrange(거래금액) %>% head()

# apt를 거래금액으로 내림차순 정렬합니다.
apt %>% arrange(-거래금액) %>% head()

# apt를 층과 거래금액으로 오름차순 정렬합니다.
apt %>% arrange(층, 거래금액) %>% head()

# apt를 층과 거래금액으로 내림차순 정렬합니다.
apt %>% arrange(-층, -거래금액) %>% head()

# apt를 층은 내림차순, 거래금액은 오름차순으로 정렬합니다.
apt %>% arrange(-층, 거래금액) %>% head()


# 집계 함수로 데이터 요약

# apt를 월로 그룹을 설정하고 거래건수와 거래금액의 평균 및 표준편차를 
# 계산합니다.
apt %>% 
  group_by(월) %>% 
  summarise(거래건수 = n(), 
            평균금액 = mean(x = 거래금액), 
            표준편차 = sd(x = 거래금액))


## End of Document
