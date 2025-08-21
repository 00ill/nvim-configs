
# 🧠 nvim-configs

Neovim 설정을 운영체제별로 분리하여 관리하는 개인 설정 저장소입니다.  
Windows와 Linux 환경에서 각각 최적화된 설정을 사용하며, 공통 설정은 `main` 브랜치에서 통합 관리합니다.

## 📁 브랜치 구조

- `main`: 공통 설정 및 전체 관리용 브랜치
- `windows`: Windows 환경에서 사용하는 설정
- `linux`: Linux 환경에서 사용하는 설정

## 🔧 주요 특징

- **Lazy.nvim** 기반 플러그인 관리
- **C 언어 및 임베디드 개발**에 최적화된 설정
- OS별 설정 분리로 충돌 없는 환경 구성
- 실제 사용 시에는 OS에 맞는 브랜치만 클론하여 사용

## 🚀 사용 방법

### Windows
```bashgit clone -b windows https://github.com/00ill/nvim-configs.git %LOCALAPPDATA%
```

### Linux
```bash
git clone -b linux https://github.com/00ill/nvim-configs.git ~/.config
```
