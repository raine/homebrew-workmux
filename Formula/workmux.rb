class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.197"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.197/workmux-darwin-arm64.tar.gz"
      sha256 "96522033d5d5bd2427ece2c5fd9f5c61584e15c69a3379014b25559628eaa20c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.197/workmux-darwin-amd64.tar.gz"
      sha256 "c552b9d1cf851459b9b65a7b6c6e1f5e2403979ef5bf5a69764fa3e3da960185"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.197/workmux-linux-arm64.tar.gz"
      sha256 "b00b5679f37f90f42e7cd659c2a401ff9529bf83675961a1728e5b33ad5eafdd"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.197/workmux-linux-amd64.tar.gz"
      sha256 "e0d5ac65cd2e5afcfc52b15dfd99c76c9e70d09f18b96379393b1b07a00c02b8"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
