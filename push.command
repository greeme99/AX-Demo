#!/bin/bash
# =====================================================
# AX-Demo GitHub Push & Pages Setup
# Finder에서 더블클릭하면 자동으로 실행됩니다
# =====================================================

DIR="/Users/greeme/Documents/5. AX-Demo/AX-Project-Demo"
REMOTE="https://github.com/greeme99/AX-Demo.git"

echo ""
echo "======================================"
echo "  AX-Demo → GitHub Push 시작"
echo "======================================"
echo ""

cd "$DIR" || { echo "❌ 폴더를 찾을 수 없습니다: $DIR"; read -p ""; exit 1; }

echo "📁 작업 폴더: $DIR"
echo ""

# git 초기화
git init 2>/dev/null
git branch -M main 2>/dev/null || true
git config user.email "greeme99@gmail.com"
git config user.name "greeme99"

# remote 설정
git remote remove origin 2>/dev/null || true
git remote add origin "$REMOTE"

# 파일 추가
echo "📦 파일 추가 중..."
git add ax-gallery2.html ax-gallery-v2.html ax-gallery.html index.html 2>/dev/null || true
git add -A

# 커밋
echo "💾 커밋 중..."
git commit -m "feat: AX 과제 갤러리 v2 — 부서별 AI 적용 사례 14건" 2>/dev/null || \
  echo "  (변경사항 없음, 기존 커밋 유지)"

# Push
echo ""
echo "🚀 GitHub로 Push 중... (GitHub 로그인이 필요할 수 있습니다)"
echo ""
git push -u origin main --force

RESULT=$?
echo ""

if [ $RESULT -eq 0 ]; then
  echo "======================================"
  echo "  ✅ Push 성공!"
  echo "======================================"
  echo ""
  echo "📌 이제 GitHub Pages를 활성화하세요."
  echo "   (브라우저가 자동으로 열립니다)"
  echo ""
  echo "   설정 방법:"
  echo "   1. Source: Deploy from a branch"
  echo "   2. Branch: main / (root)"
  echo "   3. Save 클릭"
  echo ""
  echo "   완료 후 1~2분 뒤 접속 가능:"
  echo "   https://greeme99.github.io/AX-Demo/ax-gallery2.html"
  echo ""
  # GitHub Pages 설정 페이지 자동 오픈
  open "https://github.com/greeme99/AX-Demo/settings/pages"
else
  echo "======================================"
  echo "  ❌ Push 실패"
  echo "======================================"
  echo ""
  echo "GitHub 로그인이 필요합니다."
  echo ""
  echo "아래 두 가지 중 하나를 시도하세요:"
  echo ""
  echo "방법 1) GitHub 웹에서 직접 업로드:"
  open "https://github.com/greeme99/AX-Demo/upload/main"
  echo "   → $DIR 폴더에서 파일을 드래그&드롭"
  echo ""
  echo "방법 2) GitHub CLI 설치 후 재시도:"
  echo "   brew install gh && gh auth login"
fi

echo ""
read -p "아무 키나 누르면 창이 닫힙니다..."
