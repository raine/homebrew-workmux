class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.78"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.78/workmux-darwin-arm64.tar.gz"
      sha256 "36cfdacf80b938627c7b6970e17264121f15628406790b47d8bd1df3df722f2d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.78/workmux-darwin-amd64.tar.gz"
      sha256 "e658bd5e48043b4c16d3d2f66a6d4ba500cdad3a64105d9d0d4a9f6e42fb7daa"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.78/workmux-linux-arm64.tar.gz"
      sha256 "f786f57a3bbbcaa15c59c4c749e0fa393a1ff7f593b442135463c6a6410e6dbc"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.78/workmux-linux-amd64.tar.gz"
      sha256 "67525df6705f083d2c21e6758edbed86f1d7c913008de92e688d9f2c7cd8496e"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
