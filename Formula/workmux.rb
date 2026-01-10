class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.82"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.82/workmux-darwin-arm64.tar.gz"
      sha256 "ff2d503cc44ff8277063972eb380e04fdc3743e90edb6a6c22b74e4c941661c4"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.82/workmux-darwin-amd64.tar.gz"
      sha256 "69c7298c00ab5d9ab61f057590343f65390279543f02a334b3170d3ef3a2a0c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.82/workmux-linux-arm64.tar.gz"
      sha256 "334c1c662484dd24d90bc192c0af061e6ff16de8c377307429ed3c52f3e585d4"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.82/workmux-linux-amd64.tar.gz"
      sha256 "f29810bea2817b9f0106e47f91de1d957f5b6011e711c964f2f37f8cf3eeb89d"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
