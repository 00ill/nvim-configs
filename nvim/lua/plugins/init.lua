return {
    -- 컬러스킴
    -- Kanagawa 테마 설정 및 적용
    {
        'sainnhe/everforest',
        lazy = false,
        priority = 1000,
        config = function()
            -- Optionally configure and load the colorscheme
            -- directly inside the plugin declaration.
            vim.g.everforest_enable_italic = true
            vim.cmd.colorscheme('everforest')
        end
    }
    ,
    --Dashboard (대시보드 플러그인)
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        opts = {
            theme = "hyper",
            config = {
                header = {
                    "Welcome to Neovim",
                    "Enjoy your coding!",
                },
                shortcut = {
                    {
                        desc = "󰊳 Update",
                        group = "@property",
                        action = "Lazy update",
                        key = "u",
                    },
                    {
                        desc = " Files",
                        group = "Label",
                        action = "Telescope find_files",
                        key = "f",
                    },
                    {
                        desc = " Projects",
                        group = "Label",
                        action = "Telescope project",
                        key = "p",
                    },
                },
            },
        },
    },
    -- 파일 탐색기
    
{
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")

        require("neo-tree").setup({
            window = {
                mappings = {
                    ["v"] = "open_vsplit",    -- 수직 분할로 열기
                }
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
            vim.keymap.set("n", "<leader>fg", builtin.live_grep)
            vim.keymap.set("n", "<leader>fb", builtin.buffers)
            vim.keymap.set("n", "<leader>fp", function()
                telescope.extensions.projects.projects {}
            end, { desc = "Find Projects" })
        end,
    },

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
                highlight = { enable = true },
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
            require("lualine").setup()
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
