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
    local compile_success = true

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

    -- 컴파일 과정 처리
    if compile_command ~= "" then
        local compile_output = vim.fn.system(compile_command)
        if vim.v.shell_error ~= 0 then
            compile_success = false
            -- 컴파일 에러 처리: 플로팅 윈도우에 에러 메시지 출력
            local buf, win = M.create_float_window()
            vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(compile_output, "\n"))
            return
        end
    end

    -- Floating window 생성 및 터미널 실행
    if compile_success and run_command ~= "" then
        local buf, win = M.create_float_window()
        local job_id = vim.fn.termopen(run_command, {
            on_exit = function(_, exit_code, _)
                vim.api.nvim_buf_call(buf, function()
                    -- 터미널 버퍼에서 Normal 모드로 전환
                    vim.cmd("stopinsert")
                end)
            end,
        })
        -- 터미널 버퍼에서 즉시 Insert 모드로 전환
        vim.cmd("startinsert")
    end
end

return M
