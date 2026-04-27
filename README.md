# homebrew-bunpy

Homebrew tap for [bunpy](https://github.com/tamnd/bunpy).

## Install

```sh
brew install tamnd/bunpy/bunpy
```

`Formula/bunpy.rb` is rewritten on every bunpy release by the
`tap` job in [`tamnd/bunpy/.github/workflows/release.yml`](https://github.com/tamnd/bunpy/blob/main/.github/workflows/release.yml).
Source of truth for the formula template lives at
[`tamnd/bunpy/scripts/formula.rb.tmpl`](https://github.com/tamnd/bunpy/blob/main/scripts/formula.rb.tmpl).
Do not hand-edit `Formula/bunpy.rb`; it will be overwritten on
the next tag.
