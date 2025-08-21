return {
    -- 컬러스킴
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            -- 스타일 옵션
            vim.g.gruvbox_material_background = "grey"      -- "soft", "medium", "hard"
            vim.g.gruvbox_material_foreground = "colored"   -- "material", "mix", "original"
            vim.g.gruvbox_material_enable_italic = 1        -- 기울임체 비활성화
            vim.g.gruvbox_material_enable_bold = 1          -- 굵은 글씨 활성화
            vim.g.gruvbox_material_transparent_background = 0 -- 배경 투명 비활성화
            vim.g.gruvbox_material_visual = "grey background" -- Visual 모드 강조 방식
            vim.g.gruvbox_material_ui_contrast = "high"     -- UI 대비: "low", "high"
            vim.g.gruvbox_material_statusline_style = "default" -- "default", "mix", "original"

            -- 성능 최적화
            vim.g.gruvbox_material_better_performance = 1

            -- 테마 적용
            vim.cmd("colorscheme gruvbox-material")
        end,
    }




    ,

    --Dashboard (대시보드 플러그인)
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-tree/nvim-web-devicons",   -- 아이콘
            "nvim-telescope/telescope.nvim", -- 최근 파일, 프로젝트 탐색
            "ahmedkhalf/project.nvim",       -- 프로젝트 목록
        },
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            -- 아스키 아트 헤더
            dashboard.section.header.val = {
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⢀⢄⠀⠀⡴⠁⠈⡆⠀⢀⡤⡀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠢⣄⠀⠀⡇⠀⡕⠀⢸⠀⢠⠃⠀⢮⠀⠹⠀⠀⣠⢾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⣞⠀⢀⠇⠀⡇⠀⡸⠀⠈⣆⠀⡸⠀⢰⠀⠀⡇⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⠘⢶⣯⣊⣄⡨⠟⡡⠁⠐⢌⠫⢅⣢⣑⣵⠶⠁⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⠀⠀⠀⠀⠀⣼⣀⠀⢀⠒⠒⠂⠉⠀⠀⠀⠀⠁⠐⠒⠂⡀⠀⣸⣄⠀⠀⠀⠀⠀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⢮⣵⣶⣦⡩⡲⣄⠀⠀⣿⣿⣽⠲⠭⣥⣖⣂⣀⣀⣀⣀⣐⣢⡭⠵⠖⣿⣿⢫⠀⠀⣠⣖⣯⣶⣶⣮⡷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⢸⡟⢉⣉⠙⣿⣿⣦⠀⣿⣿⣿⣿⣷⣲⠶⠤⠭⣭⡭⠭⠴⠶⣖⣾⣿⣿⡿⢸⢀⣼⣿⡿⠋⣉⠉⢳⠁⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠮⣳⣴⣫⠂⠘⣿⣿⣇⢷⢻⣿⣿⣿⣿⣿⣷⣶⣶⣶⣶⣿⣿⣿⣿⣿⢿⢃⡟⣼⣿⣿⠁⠸⣘⣢⣚⠜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠈⢧⢻ ⣿⣿⣟⠻⣿⣿⣿⣿⠛⣩⣿⣿ ⢟⡞⢀⣿⣿⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣒⣒⣦⣄⣿⣿⣿⢀⡬⣟⣯  ⣿⢷⣼⡟⢿⣿⡿⣿⣿  ⡻⣤⡀⣿⣿⣸⡠⢔⣒⡒⢤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⠀⠀⠀⠀⠀⠀⠀⢾⣟⣅⠉⢎⣽⣿⣿⡏⡟⣤⣮⣿⣿  ⡏⣿⠀⠀⣿⢡⣷  ⣿⣟⢎⣷⢻⣿⣿⣾⡟⠉⣽⡇⡇⠀⠀⠀⠀⠀⠀⠀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⡴⣫⣭⣭⣍⡲⢄⠀⠀⠀⠀⠈⠻⠋⣠⡮⣻⣿⣿⠃⠳⣏⣼⣿⣿⣿⣿⡇⣿⣴⣴⣿⣾⣿⣿⣿⡿⣄⣩⠏⢸⣿⣿⣿⣧⡀⠛⠞⠁⠀⠀⠀⢀⣤⣺⣭⣭⣭⡝⢦⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⢸⢹⡟⠁⠀⠉⢫⡳⣵⣄⠀⠀⢀⠴⢊⣿⣾⣿⣿⣿⠀⠀⠀⠻⣬⣽⣿⣿⣿⣿  ⣿⣿⣿⣿⣯⣵⠏⠀⠀⢸⣿⣿⣿⣿⣿⣗⢤⡀⠀⠀⣠⣿⢟⠟⠉⠀⠈⢻⢸⡆⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠘⢏⢧⣤⡀⠀⠀⣇⢻⣿⣆⢔⢕⣵⠟⣏⣿⣿⣿⠋⣵⠚⠄⣾⣿⣿⣿⡿⠟⣛⣛⣛⣛⠻⣿⣿⣿⣿⣧⢰⠓⣏⠻⣿⣿⣿⢹⠻⣿⣿⢦⣸⣿⡏⡾⠀⠀⢠⣤⠎⡼⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠈⠑⠂⠁⠀⠀⣿⠸⣿⢏⢂⣾⠇⠀⣿⣿⣿⡇⡆⠹⢷⣴⣿⡿⠟⠉⣐⡀⠄⣠⡄⡠⣁⡠⠙⠻⢿⣿⣴⡾⠃⢠⢹⣿⣿⢸⠀⢹⣿⣷⢹⣿⢃⡇⠀⠀⠈⠒⠋⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡀⣿⢀⣿⣿⡀⠀⢫⣿⣿⣷⣙⠒⠀⠄⠐⠂⣼⠾⣵⠾⠟⣛⣛⠺⢷⣮⠷⣢⠐⠂⠀⠀⠒⣣⣾⣿⡿⡎⠀⢠⣿⣿⡄⣿⣸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣟⣿⢸⣿⣿⣷⣄⡈⣾⣿⣿⣿⣿⣿⠻⡷⢺⠃⠠⠁⠈⠋⠀⠀⠉⠁⠙⡀⠘⡗⣾⠿⣿⣿⣿⣿⣿⡿⢀⣴⣿⣿⡿⢃⣯⣽⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⡆⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣵⡞⠀⠁⠐⢁⠎⠄⣠⠀⠀⡄⠀⢳⠈⠆⠈⠈⢳⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⣸⡷⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣌⠛⢿⣿⣿⣿⣿⣿⣿⠿⠋⣠⣢⠂⠀⢂⠌⠀⠃⠀⠀⠘⠀⢢⡑⠀⠰⣵⡀⠻⢿⣿⣿⣿⣿⣿⣿⡿⠋⣰⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠳⣤⣭⢛⣻⠿⣿⣷⣶⢞⡟⡁⢀⢄⠎⠀⠀⠀⠀⠀⡀⠁⠀⠳⢠⠀⢈⢿⢳⣶⣾⣿⠿⣟⣛⣅⡴⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠛⠻⠿⠿⡟⢜⠔⡠⢊⠔⠀⡆⠀⡆⠀⠀⢡⢰⢠⠀⢢⠱⣌⢂⠃⢿⠿⠿⠟⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢤⣊⡰⠵⢺⠉⠸⠀⢰⢃⠀⠀⠀⠀⠀⠸⢸⠀⠀⡇⡞⡑⠬⢆⣑⢤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠘⣾⡸⢀⡜⡾⡀⡇⠀⠀⡴⢠⢻⢦⠀⢃⡿⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⡎⠀⠱⡡⠐⠀⠠⠃⢢⠋⠀⢧⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢤⡀⢀⠔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            }

            -- 단축키 버튼
            dashboard.section.buttons.val = {
                dashboard.button("u", "󰊳 Update Plugins", ":Lazy update<CR>"),
                dashboard.button("f", " Find Files", ":Telescope find_files<CR>"),
                dashboard.button("r", " Recent Files", ":Telescope oldfiles<CR>"),
                dashboard.button("p", " Projects", ":Telescope projects<CR>"),
                dashboard.button("q", " Quit", ":qa<CR>"),
            }

            -- 푸터 메시지
            dashboard.section.footer.val = {
                "",
                "🚀 Happy coding, 최영일 연구원님!",
            }

            -- 레이아웃 구성
            dashboard.config.layout = {
                { type = "padding", val = 1 },
                dashboard.section.header,
                { type = "padding", val = 2 },
                dashboard.section.buttons,
                { type = "padding", val = 2 },
                dashboard.section.footer,
            }

            alpha.setup(dashboard.config)

            -- 프로젝트.nvim 초기화 (선택 사항)
            require("project_nvim").setup {}
        end,
    }


    ,
    -- 파일 탐색기

    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            -- 아이콘 플러그인 수동 로딩 (중요)
            require("nvim-web-devicons").setup()

            -- 파일 탐색기 토글 키맵
            vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")

            -- neo-tree 설정
            require("neo-tree").setup({
                window = {
                    mappings = {
                        ["v"] = "open_vsplit", -- 수직 분할로 열기
                    }
                },
                filesystem = {
                    filtered_items = {
                        visible = true,         -- 숨김 파일도 표시
                        hide_dotfiles = false,  -- .파일 숨기지 않음
                        hide_gitignored = false -- gitignore된 파일도 표시
                    },
                },
                default_component_configs = {
                    icon = {
                        folder_closed = "", -- 닫힌 폴더 아이콘
                        folder_open = "", -- 열린 폴더 아이콘
                        folder_empty = "", -- 빈 폴더 아이콘
                        default = "", -- 일반 파일 아이콘
                        highlight = "NeoTreeFileIcon",
                    },
                    name = {
                        trailing_slash = false,
                        use_git_status_colors = true,
                        highlight = "NeoTreeFileName",
                    },
                }
            })
        end
    }


    ,
    -- 퍼지 파인더 (수정)
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            -- 프로젝트 확장 로딩
            telescope.load_extension("projects")
            pcall(telescope.load_extension, "project")

            -- 키맵 설정
            vim.keymap.set("n", "<leader>ff", builtin.find_files)

            vim.keymap.set("n", "<leader>fg", function()
                builtin.live_grep({
                    default_text = vim.fn.expand("<cword>"),
                    glob_pattern = { "*.c", "*.h", "*.cpp" },
                    attach_mappings = function(_, map)
                        vim.schedule(function()
                            vim.cmd("stopinsert")
                        end)
                        return true
                    end,
                })
            end, { desc = "Live Grep with word under cursor (C/C++ only)" })

            vim.keymap.set("n", "<leader>fb", builtin.buffers)
            vim.keymap.set("n", "<leader>fp", function()
                telescope.extensions.projects.projects {}
            end, { desc = "Find Projects" })
        end,
    }

    ,

    -- Telescope project 확장
    {
        "nvim-telescope/telescope-project.nvim",
        config = function()
            require("telescope").load_extension("project")
        end,
    },
    -- Treesitter (구문 하이라이팅)
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "python", "javascript", "html", "css" },
                highlight = { enable = true, additional_vim_regex_highlighting = false, },
                indent = { enable = true },
            })
        end
    },
    --검색 결과 하이라이팅
    {
        "kevinhwang91/nvim-hlslens",
        config = function()
            require("hlslens").setup {
                nearest_only = true, -- 현재 위치만 강조, 숫자 인덱스 숨김
            }

            vim.cmd([[
      nnoremap n <Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>
      nnoremap N <Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>
      nnoremap * *<Cmd>lua require('hlslens').start()<CR>
      nnoremap # #<Cmd>lua require('hlslens').start()<CR>
      nnoremap g* g*<Cmd>lua require('hlslens').start()<CR>
      nnoremap g# g#<Cmd>lua require('hlslens').start()<CR>
    ]])
        end,
    }
    ,
    -- 자동 괄호/따옴표 쌍 입력
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
        end
    },

    -- 들여쓰기 가이드라인
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            scope = { enabled = true },
            indent = { char = "│" },
            exclude = { filetypes = { "dashboard", "help", "neo-tree", "Trouble" } }
        }
    },

    -- 코드 주석 토글 플러그인
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },
    -- 상태바

    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                },
            })
        end
    },


    -- nvim-cmp 기본 설정
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                -- 자동완성 기본 설정
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                },
                mapping = {
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                },
            })
            -- 커맨드라인 자동완성 설정
            cmp.setup.cmdline(":", {
                sources = {
                    { name = "cmdline" }
                }
            })
        end
    },
    -- 프로젝트 관리 플러그인
    {
        "ahmedkhalf/project.nvim",
        config = function()
            local project = require("project_nvim")
            local util    = require("lspconfig.util") -- 이 줄을 추가합니다.

            project.setup({
                manual_mode       = false,
                detection_methods = { "lsp", "pattern" },
                patterns          = {
                    ".git",
                    "Makefile",
                    "compile_commands.json",
                    "ProcessorExpert.pe", -- S32DS 패턴도 추가
                },
                -- (그 외 옵션)
            })

            -- Telescope 프로젝트 확장 로드
            require("telescope").load_extension("projects")

            -- root_dir override 예시 (옵션)
            vim.api.nvim_create_autocmd("BufReadPost", {
                callback = function()
                    local root = util.root_pattern(
                        ".git",
                        "compile_commands.json",
                        "Makefile",
                        "ProcessorExpert.pe"
                    )(vim.fn.getcwd())
                    if root then
                        vim.cmd(("lcd %s"):format(root))
                    end
                end,
            })
        end,
    },
    -- noice.nvim 설정
    {
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                    },
                },
                presets = {
                    command_palette = true,
                    long_message_to_split = true,
                    inc_rename = true,
                },
            })
        end
    }
}
