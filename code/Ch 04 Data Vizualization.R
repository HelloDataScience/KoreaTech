
# ----------------------------------------------------------------------------
# ggplot2 패키지 함수 사용 예제
# ----------------------------------------------------------------------------

# ggplot2 패키지의 주요 기능을 실습합니다.
ggplot(data = mpg, 
       map = aes(x = hwy, y = cty, fill = cyl)) + 
  geom_point(shape = 21, size = 3, color = 'gray') + 
  coord_cartesian(xlim = c(10, 45)) + 
  scale_fill_distiller(palette = 'YlOrRd') + 
  theme_bw()


# ----------------------------------------------------------------------------
# [참고] 한글 폰트 추가
# ----------------------------------------------------------------------------

# 관련 패키지를 호출합니다.
library(showtext)

# 구글 폰트를 설치합니다.
font_add_google(name = 'Nanum Gothic')
font_add_google(name = 'Gamja Flower')

# 설치한 구글 폰트를 그래픽 장치에서 사용할 수 있도록 설정합니다.
showtext_auto()


# ----------------------------------------------------------------------------
# 히스토그램 그리기
# ----------------------------------------------------------------------------

# 거래금액의 최솟값과 최댓값을 확인합니다.
range(apt$거래금액)

# 히스토그램의 막대 간격을 설정합니다.
breaks <- seq(from = 0, to = 70, by = 2)

# 히스토그램의 막대 채우기 및 테두리 색을 설정합니다.
ggplot(data = apt, map = aes(x = 거래금액)) + 
  geom_histogram(breaks = breaks, fill = 'pink', color = 'gray30')

# 히스토그램에 제목과 축명 및 Black and White 테마를 추가합니다.
ggplot(data = apt, map = aes(x = 거래금액)) + 
  geom_histogram(breaks = breaks, fill = 'pink', color = 'gray30') + 
  labs(title = '거래금액의 분포', x = '거래금액', y = '빈도수') + 
  theme_bw(base_family = 'Gamja Flower')


# ----------------------------------------------------------------------------
# 일변량 상자 수염 그림
# ----------------------------------------------------------------------------

# 거래금액으로 상자 수염 그림을 그립니다.
ggplot(data = apt, map = aes(y = 거래금액)) + 
  geom_boxplot(fill = 'pink', color = 'gray30', 
               outlier.color = 'darkred', outlier.fill = 'red', 
               outlier.shape = 21, outlier.size = 2, 
               outlier.stroke = 1, outlier.alpha = 0.5) + 
  labs(title = '거래금액의 분포') + 
  theme_bw(base_family = 'Gamja Flower')


# ----------------------------------------------------------------------------
# 이변량 상자 수염 그림
# ----------------------------------------------------------------------------

# 월별 거래금액으로 상자 수염 그림을 그립니다.
ggplot(data = apt, map = aes(x = 월, y = 거래금액)) +
  geom_boxplot(map = aes(fill = 월), color = 'gray30', 
               outlier.color = 'darkred', outlier.fill = 'red',
               outlier.shape = 21, outlier.size = 2,
               outlier.stroke = 1, outlier.alpha = 0.5) +
  labs(title = '월별 거래금액의 분포', x = '거래월') +
  theme_bw(base_family = 'Gamja Flower')


# ----------------------------------------------------------------------------
# 일변량 막대 그래프 그리기
# ----------------------------------------------------------------------------

# 월별 빈도수로 막대 그래프를 그립니다.
ggplot(data = apt, map = aes(x = 월)) +
  geom_bar(map = aes(fill = 월), color = 'gray30') + 
  labs(title = '월별 거래건수의 비교', x = '거래월', y = '거래건수') +
  theme_bw(base_family = 'Gamja Flower')


# ----------------------------------------------------------------------------
# 이변량 막대 그래프 그리기
# ----------------------------------------------------------------------------

# 월별 거래금액 평균으로 데이터프레임 avg를 생성합니다.
apt %>% 
  group_by(월) %>% 
  summarise(평균금액 = mean(x = 거래금액),
            평균금액 = round(x = 평균금액, digits = 2)) -> avg

# avg의 구조를 확인합니다.
str(object = avg)

# avg의 월별 평균금액으로 막대 그래프를 그립니다.
ggplot(data = avg, map = aes(x = 월, y = 평균금액)) + 
  geom_col(map = aes(fill = 월), color = 'gray30') + 
  labs(title = '월별 평균금액의 비교', x = '거래월', y = '평균금액') +
  theme_bw(base_family = 'Gamja Flower')

# 막대 위에 평균금액을 텍스트로 추가합니다.
ggplot(data = avg, map = aes(x = 월, y = 평균금액)) + 
  geom_col(map = aes(fill = 월), color = 'gray30') + 
  coord_cartesian(ylim = c(0, 25)) +
  geom_text(map = aes(label = 평균금액), vjust = -1, size = 3) +
  labs(title = '월별 평균금액의 비교', x = '거래월', y = '평균금액') +
  theme_bw(base_family = 'Gamja Flower')


# ----------------------------------------------------------------------------
# 선 그래프 그리기
# ----------------------------------------------------------------------------

# avg의 월별 평균금액으로 선 그래프를 그립니다.
ggplot(data = avg, map = aes(x = 월, y = 평균금액, group = 1)) + 
  geom_line(color = 'red', linetype = 1, size = 1) + 
  labs(title = '월별 평균금액의 변화', x = '거래월', y = '평균금액') + 
  theme_bw(base_family = 'Gamja Flower')


# ----------------------------------------------------------------------------
# 산점도 그리기
# ----------------------------------------------------------------------------

# avg의 전용면적과 거래금액으로 산점도를 그립니다.
ggplot(data = apt, map = aes(x = 전용면적, y = 거래금액)) + 
  geom_point(color = 'gray30', fill = 'gray80', 
             shape = 21, size = 2, stroke = 0.5, alpha = 0.5) + 
  labs(title = '전용면적과 거래금액의 관계') + 
  theme_bw(base_family = 'Gamja Flower')


## End of Document
