class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.55"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.55/aarch64-apple-darwin.tar.gz"
      sha256 "b5d0fe0cdf93f9f1dad0649e957dc74e0e8617f0fe53e919df236cfb7335aba7"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.55/x86_64-apple-darwin.tar.gz"
      sha256 "772c9c84cb0157839754e9dd1d63116f521b159cf434969e05ebe3cf4306864b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.55/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f18d0d012a50930a14e441b58d87513192bbf7b1c4a734d6e448ae74342f3cf"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.55/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c980706535e9bd71ba792525ec684ff34bd3f712b9ce5a424158aab1894a545c"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
