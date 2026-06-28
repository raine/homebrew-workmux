class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.216"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.216/workmux-darwin-arm64.tar.gz"
      sha256 "c4720ce8f6a6c9a89c09e49266891c5b823f2401fdbe56cb7f56f26fba129867"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.216/workmux-darwin-amd64.tar.gz"
      sha256 "890084cdfcda3c9593ddedb1c3f722ecf0d006c78484e806fd64d8c20b1d5536"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.216/workmux-linux-arm64.tar.gz"
      sha256 "dc782bb58e8b9eb054bfb1a70e69f7bccdb6548a109ed42f0d44cc4b71020cef"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.216/workmux-linux-amd64.tar.gz"
      sha256 "85e74f66c944eeabaf1d7d339e8e66aaf579b81012627b55fabdc4ea768034ad"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
