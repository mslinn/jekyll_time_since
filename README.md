# Jekyll Plugin Gem Customization

The [`bin/run_this_first`](bin/run_this_first) script customizes your new Jekyll plugin gem.
It does the following:
  1) Renames the Jekyll template, including directories, files and contents.
  2) Deletes itself, its tests and its test data.
  3) Does not delete tests for the Jekyll plugin.
  4) Deletes this README.md and renames [`PLUGIN_README.md`](PLUGIN_README.md) to `README.md`.
  5) Initializes a new local git repository and optionally creates a public or private project on GitHub.
  6) Provides scripts for building and testing your new Jekyll plugin gem locally.
  7) Provides settings for Visual Studio Code, Rake, Rubocop and RSpec.

The customized gem is ready to be pushed to RubyGems.org, or any other Ruby gem repository, whenever your feel ready.


## Usage
  1) Clone this repo.
  2) Run the `bin/run_this_first` script and answer the prompts.
  3) Open the project in Visual Studio Code and explore the project:
     ```shell
     $ code .
     ```
  4) You can immediately use your new Jekyll plugin in a Jekyll website.


## For More Information
Please see the blog post about this {% href https://mslinn.com/blog/2022/03/28/jekyll-plugin-template-collection.html Jekyll plugin gem template %}.


## Hook Call Order
The Jekyll documentation does not say the exact order that hooks get called.
However, this template makes that clear.
Following is elided output; I removed duplicate log entries.
Output will vary, depending on the Jekyll site that is processed.
`:post_init`, in particular, gets called many times.
```
INFO Module: Jekyll::Hooks.register(:site, :after_reset) invoked.
INFO Module: Jekyll::Hooks.register(:pages, :post_init) invoked.
INFO Module: Jekyll::Hooks.register(:documents, :post_init) invoked.
INFO Module: Jekyll::Hooks.register(:posts, :post_init) invoked.
INFO Module: Jekyll::Hooks.register(:site, :post_read) invoked.
INFO Module: Jekyll::Hooks.register(:pages, :post_init) invoked.
INFO Module: Jekyll::Hooks.register(:site, :pre_render) invoked.
INFO Module: Jekyll::Hooks.register(:pages, :pre_render) invoked.
INFO Module: Jekyll::Hooks.register(:pages, :post_convert) invoked.
INFO Module: Jekyll::Hooks.register(:pages, :post_render) invoked.
INFO Module: Jekyll::Hooks.register(:site, :post_render) invoked.
INFO Module: Jekyll::Hooks.register(:clean, :on_obsolete) invoked for [].
INFO Module: Jekyll::Hooks.register(:pages, :post_write) invoked.
```
