#!/bin/bash
# ============================================================
# AX-Demo → GitHub Push Script
# 실행 방법: Terminal에서 sh push-to-github.sh
# ============================================================
set -e

REPO_DIR="/Users/greeme/Documents/5. AX-Demo/AX-Project-Demo"
REMOTE_URL="https://github.com/greeme99/AX-Demo.git"

echo "📁 폴더 이동: $REPO_DIR"
cd "$REPO_DIR"

# Git 초기화 (이미 있으면 skip)
if [ ! -d ".git" ]; then
  echo "🔧 git init"
  git init
fi

git config user.email "greeme99@gmail.com"
git config user.name "greeme99"

# 브랜치 이름 main으로 설정
git branch -M main 2>/dev/null || true

# remote 설정
if git remote | grep -q origin; then
  git remote set-url origin "$REMOTE_URL"
else
  git remote add origin "$REMOTE_URL"
fi

echo "📦 파일 추가 중..."
git add -A

echo "💾 커밋 중..."
git commit -m "feat: AX 과제 갤러리 v1.0 — 부서별 AI 적용 사례 14건 데모" \
  --allow-empty 2>/dev/null || \
git commit -m "chore: 파일 업데이트" 2>/dev/null || \
echo "✅ 이미 최신 상태 (커밋할 내용 없음)"

echo "🚀 GitHub 푸시 중..."
git push -u origin main

echo ""
echo "========================================"
echo "✅ 푸시 완료!"
echo "========================================"
echo ""
echo "🌐 GitHub Pages 활성화 방법:"
echo "  1. https://github.com/greeme99/AX-Demo/settings/pages 접속"
echo "  2. Source: 'Deploy from a branch'"
echo "  3. Branch: main  /  폴더: / (root)"
echo "  4. Save 클릭"
echo ""
echo "📌 갤러리 URL (1~2분 후 접속 가능):"
echo "  https://greeme99.github.io/AX-Demo/"
echo ""
echo "📌 노션 임베드 URL:"
echo "  https://greeme99.github.io/AX-Demo/ax-gallery.html"
echo "========================================"
