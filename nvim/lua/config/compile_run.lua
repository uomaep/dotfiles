local M = {}

function M.create_float_window()
    local buf = vim.api.nvim_create_buf(false, true) -- Floating window를 위한 버퍼 생성
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")

    -- 플로팅 윈도우의 크기 계산
    local win_width = math.ceil(width * 0.8)
    local win_height = math.ceil(height * 0.8)

    -- 플로팅 윈도우가 화면 정중앙에 위치하도록 col과 row 계산
    local col = math.ceil((width - win_width) / 2)
    local row = math.ceil((height - win_height) / 2)

    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = win_width,
        height = win_height,
        col = col,
        row = row,
        style = "minimal",
        border = "rounded",
    })

    -- Floating window의 크기 및 위치 설정
    --local win_height = math.ceil(height * 0.8 - 4)
    --local win_width = math.ceil(width * 0.8)
    --local row = math.ceil((height - win_height) / 2 - 1)
    --local col = math.ceil((width - win_width) / 2)

    --local opts = {
    --    relative = "editor",
    --    width = win_width,
    --    height = win_height,
    --    row = row,
    --    col = col,
    --    style = "minimal",
    --}

    ---- Floating window 생성
    --local win = vim.api.nvim_open_win(buf, true, opts)

    -- `q` 키로 floating window 닫기
    vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })

    return buf, win
end

function M.compile_and_run()
    local file = vim.fn.expand("%:t")
    local ext = vim.fn.expand("%:e")
    local filename = vim.fn.expand("%:t:r")
    local compile_command = ""
    local run_command = ""

    if ext == "cpp" then
        compile_command = string.format("g++ -std=c++11 %s -o %s", file, filename)
        run_command = string.format("./%s", filename)
    elseif ext == "py" then
        run_command = string.format("python3 %s", file)
    elseif ext == "java" then
        compile_command = string.format("javac %s", file)
        run_command = string.format("java %s", filename)
    else
        print("Unsupported file type: " .. ext)
        return
    end

    if compile_command ~= "" then
        os.execute(compile_command)
    end

    -- Floating window 생성 및 터미널 실행
    if run_command ~= "" then
        local buf, win = M.create_float_window()
        local job_id = vim.fn.termopen(run_command, {
            on_exit = function(_, exit_code, _)
                if exit_code == 0 then
                    -- 프로그램이 정상 종료됐을 때 실행될 코드
                    vim.api.nvim_buf_call(buf, function()
                        -- 터미널 버퍼에서 Normal 모드로 전환
                        vim.cmd("stopinsert")
                    end)
                end
            end,
        })
        -- 터미널 버퍼에서 즉시 Insert 모드로 전환
        vim.cmd("startinsert")
    end
end

return M
