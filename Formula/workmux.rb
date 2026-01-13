class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.88"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.88/workmux-darwin-arm64.tar.gz"
      sha256 "cf66441189389c40b0046015fb7d9e71e9aabd91062288547a872f39800f0216"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.88/workmux-darwin-amd64.tar.gz"
      sha256 "0227c9bfee5d70e49ad52c2cc24cee4162a099eee59b10186757dd1067a25980"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.88/workmux-linux-arm64.tar.gz"
      sha256 "6499b6e41c1dee428b887d243f2b656162daf8078b588059bada19923f0cf6fb"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.88/workmux-linux-amd64.tar.gz"
      sha256 "47bbec2b2025015dd63745476b1d88045fd727cb0773a252f5742e4f028cd61f"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
