class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.258"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.258/workmux-darwin-arm64.tar.gz"
      sha256 "426dbdb2dc37c4af6e09ca3f776abd4433941e3da7f169dcaa78f8819ac15763"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.258/workmux-darwin-amd64.tar.gz"
      sha256 "924fb430f272db5c0cd461655423309d21cdf17e1249a39310d7ccce3c764ce8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.258/workmux-linux-arm64.tar.gz"
      sha256 "26255a9cfcf6a5626b80ef7755d06bfafd63123fc38afceab95acc4e5c7e67f8"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.258/workmux-linux-amd64.tar.gz"
      sha256 "1de5408cf835ac78cb20b8c553e6f10785480b9b55efe15cf692fda5fb09b2df"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
