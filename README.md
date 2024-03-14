<img width="1186" alt="스크린샷 2024-03-14 오후 5 40 54" src="https://github.com/uomaep/dotfiles/assets/114221785/1cfe9d57-31d9-4223-8e2c-1b28d3d8820b">

<img width="1186" alt="스크린샷 2024-03-14 오후 5 43 40" src="https://github.com/uomaep/dotfiles/assets/114221785/f438337b-3251-4ada-bdd0-f8a96352ca2e">

# Uomaep's dotfiles
**Warning**: Don’t blindly use my settings unless you know what that entails. Use at your own risk!

## Features (기능들)
- vim (Neovim) config
- tmux config
- git config
- fish config

## Neovim setup (네오빔 설정)
### Requirements (요구사항)
- Neovim
- Git
- LazyVim
- a Nerd Font (optional, but needed to display some icons)
- a C compiler for `nvim-treesitter`.
- for telescope.nvim (optional)

## Shell setup (macOS & Linux)
- Fish shell
- Fisher - Plugin manager
- Tide - Shell theme
- Nerd fonts - I use BlexMono Nerd font
- Eza - `ls` replacement (이쁘게 출력)
<img width="1186" alt="스크린샷 2024-03-14 오후 5 52 30" src="https://github.com/uomaep/dotfiles/assets/114221785/7e573967-532d-4cae-8d87-526213b03210">

## Custom functions created using Neovim and LazyVim
- A function to immediately compile and execute the source file being edited with Neovim and output the results on a floating screen.
- Neovim으로 편집하고 있는 소스파일을 바로 컴파일 및 실행하여 플로팅 화면으로 결과를 출력하는 기능

### detail of fuction<br>기능 설명
1. As an example, edit the C++ source file with Neovim, compile and run it.<br>예시로 Neovim으로 c++ 소스파일은 편집하고 컴파일 및 실행
   <img width="1296" alt="스크린샷 2024-03-14 오후 6 01 03" src="https://github.com/uomaep/dotfiles/assets/114221785/3d584cee-c6ff-465a-bb5d-7c332b7a0e58">

2. When you press the <leader> key, the lazyVim help window appears. (In my setup, the <leader> key is the <space> key.)<br><leader> 키를 누르면lazyVim 도움말 창이 나타납니다. (제 설정에서 <leader> 키는 <space> 키 입니다.)
   <img width="1296" alt="스크린샷 2024-03-14 오후 6 02 51" src="https://github.com/uomaep/dotfiles/assets/114221785/991c5221-4e22-42f2-bd8e-9c6b721d4b67">

3. You can use my custom function by pressing the "r" key when the lazyVim help window is displayed.<br>lazyVim 도움창이 뜬 상태에서 "r" 키를 누르면 저의 커스텀 기능을 사용할 수 있습니다.
   <img width="1296" alt="스크린샷 2024-03-14 오후 6 04 28" src="https://github.com/uomaep/dotfiles/assets/114221785/987f024c-2f25-48fc-91b4-9c335a5ee70c">

4. The compilation and execution results are displayed on a floating screen, and when you press the "q" key, the window disappears.<br>플로팅 화면에 컴파일 및 실행 결과가 출력되며, "q" 키를 누르면 창이 없어집니다.

As an additional explanation, it was confirmed that input methods such as cin and Scanner's next() in C++ and Java languages ​​also work. If you find anything wrong with my configuration file, please leave an issue. Additionally, descriptions of these custom settings files will be organized in the readme.md file within the folder later.<br>추가적인 설명으로 c++, java 언어에서 cin과 Scanner의 next()와 같은 입력 메서드도 작동하는 것을 확인하였습니다. 혹시 제 설정파일에서 이상이 발견되면 issue에 남겨주세요. 또한 이러한 커스텀 설정 파일 설명도 추후에 해당 폴더 내의 readme.md 파일에 정리하겠습니다.
