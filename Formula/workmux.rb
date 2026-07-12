class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.219"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.219/workmux-darwin-arm64.tar.gz"
      sha256 "90aafc703d3f10a4be073e39647e8a811043ed1a43cd46a1b2542f4c9ca054aa"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.219/workmux-darwin-amd64.tar.gz"
      sha256 "32a10543a817dead7d9508ca6b8f7b2d36b9247c6c72cac6d7a74cb7244aef3c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.219/workmux-linux-arm64.tar.gz"
      sha256 "0756384d360b51c1618dcd56cf7133ffe974b909238669b5b73cd3b371ba44dc"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.219/workmux-linux-amd64.tar.gz"
      sha256 "dc2c194b75484ad199cb778b530e0dad8231bfb35d60835d1fdc4f207b5f806d"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
