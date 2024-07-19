local gen = require("gen")
-- models
local deepseek_coder = "deepseek-coder-v2:latest"
local llama3 = "llama3:latest"
local tavernari_git_commit_message = "tavernari/git-commit-message:latest"
local gemma2 = "gemma2:latest"
local mistral = "mistral:latest"

-- prompt
local prompt_tech_stack = "Next.js, App Router, TypeScript, ShadcnUI, Tailwind CSS"
local prompt_nextjs = "My role is specialized in "
  .. prompt_tech_stack
  .. "; avoids pages router. Has preloaded documentation of Next.js version 14 and ShadcnUI version 0.8.\n"
-- extract
local extract_code_block = "```$filetype\n(.-)```"

gen.setup({
  model = gemma2,
  host = "localhost", -- The host running the Ollama service.
  port = "11434", -- The port on which the Ollama service is listening.
  quit_map = "q", -- set keymap for close the response window
  retry_map = "<c-r>", -- set keymap to re-send the current prompt
  init = function(options)
    pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
  end,
  -- Function to initialize Ollama
  command = function(options)
    local body = { model = options.model, stream = true }
    return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
  end,
  display_mode = "split", -- "float" or "split" or "horizontal-split".
  show_prompt = true, -- Shows the prompt submitted to Ollama.
  show_model = true, -- Displays which model you are using at the beginning of your chat session.
  no_auto_close = true, -- Never closes the window automatically.
  debug = false, -- Prints errors and the command which is run.
})

-- CUSTOM PROMPTS
-- Nextjs Explain Code
gen.prompts["next_explain_code"] = {
  prompt = prompt_nextjs .. "Explain the following code:\n",
  model = deepseek_coder,
  replace = false,
}
-- Nextjs Fix Code
gen.prompts["next_fix_code"] = {
  prompt = prompt_nextjs
    .. "Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```. The problem is $input\n",
  replace = false,
  model = deepseek_coder,
}
-- Nextjs Ask
gen.prompts["next_ask"] = {
  prompt = prompt_nextjs .. "Can I ask you something ?\n $input",
  model = deepseek_coder,
}

-- Review Commit message
gen.prompts["review_commit_message"] = {
  prompt = "Review my commit message: ",
  model = tavernari_git_commit_message,
}
