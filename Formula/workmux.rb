class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.162"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.162/workmux-darwin-arm64.tar.gz"
      sha256 "7797d907824145566dc7270a2c40b54a3982c3e7fdb02dba84cfd23e61b037d1"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.162/workmux-darwin-amd64.tar.gz"
      sha256 "757ae8e8cc6acded2a13593dac44acbadb4c373d12e1295871e9a3dd6eda5c40"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.162/workmux-linux-arm64.tar.gz"
      sha256 "d35b4f0e764846a41cfe49a7dafc2224671f03c706ff45de415d9ead4f0c569d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.162/workmux-linux-amd64.tar.gz"
      sha256 "bab6e26ea42b4af5e98267eeb93778da1d13d3d9c5de69073b6f5409054c2e76"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
