class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.257"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.257/workmux-darwin-arm64.tar.gz"
      sha256 "7a9f8d891dee7a6d7df00e0d540da6f867893a6684216448d8c3b865e3de84b1"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.257/workmux-darwin-amd64.tar.gz"
      sha256 "5934a0dd56c95f487a06457676f7639d0b32b3f4f2ad6a5dfa83d5158c6840b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.257/workmux-linux-arm64.tar.gz"
      sha256 "6723555847780d092fbc2fd6fbb26502deed15493dd93fc5798389d0f5f86ca9"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.257/workmux-linux-amd64.tar.gz"
      sha256 "bc516ee0d6674e5635acac2aa9b2e86c238ecd46c27f55db0d28703b8ed5736b"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
