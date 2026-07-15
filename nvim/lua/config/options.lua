vim.opt.spell = true
vim.opt.spelllang = { "en" }

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.filetype.add({
  extension = {
    gotmpl = "gotmpl",
    tmpl = "gotmpl",
    aspnetcorerazor = "aspnetcorerazor",
    ["astro-markdown"] = "astro-markdown",
    ["django-html"] = "django-html",
    edge = "edge",
    ejs = "ejs",
    erb = "erb",
    gohtml = "gohtml",
    gohtmltmpl = "gohtmltmpl",
    hbs = "hbs",
    ["html-eex"] = "html-eex",
    jade = "jade",
    leaf = "leaf",
    mdx = "mdx",
    njk = "njk",
    nunjucks = "nunjucks",
    slim = "slim",
    postcss = "postcss",
    sugarss = "sugarss",
    reason = "reason",
  },
  filename = {
    ["docker-compose.yaml"] = "yaml.docker-compose",
    ["docker-compose.yml"] = "yaml.docker-compose",
    ["compose.yaml"] = "yaml.docker-compose",
    ["compose.yml"] = "yaml.docker-compose",
    [".gitlab-ci.yml"] = "yaml.gitlab",
    [".gitlab-ci.yaml"] = "yaml.gitlab",
    ["values.yaml"] = "yaml.helm-values",
    ["values.yml"] = "yaml.helm-values",
  },
})
