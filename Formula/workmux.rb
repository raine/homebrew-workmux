class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.166"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.166/workmux-darwin-arm64.tar.gz"
      sha256 "46a476487646250723b2c7110ccfe376d9e9c4021b887f6de9bd20493cff9bc2"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.166/workmux-darwin-amd64.tar.gz"
      sha256 "965a08a75fff87b23c0242e0c5093dd6938edbc10f9011b6947de46cf0078100"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.166/workmux-linux-arm64.tar.gz"
      sha256 "3ce5600336bd538c7ca3c072aeeac3733a90d2b0f68179598847120bcba8d9a1"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.166/workmux-linux-amd64.tar.gz"
      sha256 "8078ae07c6096b69977482a2c11612b038ef4593217f4d0e6cd44bd8d644e74f"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
