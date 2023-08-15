
# ----------------------------------------------------------------------------
# 데이터 입출력
# ----------------------------------------------------------------------------

# 작업 경로 확인 및 변경

# 현재 작업 경로를 확인합니다.
getwd()

# 데이터 파일이 있는 폴더로 작업 경로를 변경합니다.(절대 경로)
setwd(dir = 'C:\\Users\\계정이름\\Documents\\KoreaTech\\data')

# 현재 작업 경로를 다시 확인합니다.
getwd()

# 상위 폴더로 작업 경로를 변경합니다.(상대 경로)
setwd(dir = '..')

# 현재 작업 경로를 다시 확인합니다.
getwd()

# 데이터 파일이 있는 폴더로 작업 경로를 변경합니다.(상대 경로)
setwd(dir = './data')

# 현재 작업 경로를 다시 확인합니다.
getwd()

# 현재 작업 경로에 있는 폴더명과 파일명을 출력합니다.
list.files()


# xlsx 파일 입출력

# 관련 패키지를 호출합니다.
library(writexl)

# 데이터프레임 iris를 xlsx 파일로 저장합니다.
write_xlsx(x = iris, path = 'iris.xlsx')

# 현재 작업 경로에 있는 폴더명과 파일명을 출력합니다.
list.files()


# 관련 패키지를 호출합니다.
library(readxl)

# xlsx 파일을 읽고 데이터프레임 obj1을 생성합니다.
obj1 <- read_xlsx(path = 'iris.xlsx')

# obj1의 구조를 확인합니다.
str(object = obj1)


# csv 파일 입출력

# 데이터프레임 iris를 csv 파일로 저장합니다.
write.csv(x = iris, file = 'iris.csv', row.names = FALSE)

# 현재 작업 경로에 있는 폴더명과 파일명을 출력합니다.
list.files()

# csv 파일을 읽고 데이터프레임 obj2를 생성합니다.
obj2 <- read.csv(file = 'iris.csv')

# obj2의 구조를 확인합니다.
str(object = obj2)


# 텍스트 파일의 문자 인코딩 방식 확인

# 관련 패키지를 호출합니다.
library(readr)

# csv 파일명을 변수에 할당합니다.
fileName <- 'APT_Price_Gangnam_2020.csv'

# csv 파일의 문자 인코딩 방식을 확인합니다.
guess_encoding(file = fileName)

# 텍스트 파일을 읽습니다.
apt <- read.csv(file = fileName)

# 텍스트 파일의 문자 인코딩 방식을 지정하여 읽습니다.
apt <- read.csv(file = fileName, fileEncoding = 'CP949')

# apt의 구조를 확인합니다.
str(object = apt)


# RDS 파일 입출력

# 데이터프레임 iris를 RDS 파일로 저장합니다.
saveRDS(object = iris, file = 'iris.RDS')

# 현재 작업 경로에 있는 폴더명과 파일명을 출력합니다.
list.files()

# RDS 파일을 읽고 데이터프레임 obj3를 생성합니다.
obj3 <- readRDS(file = 'iris.RDS')

# obj3의 구조를 확인합니다.
str(object = obj3)


## End of Document
