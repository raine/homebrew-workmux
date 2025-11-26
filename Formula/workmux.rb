class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.30/aarch64-apple-darwin.tar.gz"
      sha256 "6f9ec7b7550e4e4537ec693ac344377fa6f2daa897e71c82306daa56db497468"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.30/x86_64-apple-darwin.tar.gz"
      sha256 "45b6094b88a1e0657a9d1d99d92123ebfffb7592d4c44a63f8b281cc8473095d"
    end
  end

  on_linux do
    url "https://github.com/raine/workmux/releases/download/v0.1.30/x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3d0a7729b4038eb3a3498e727445a00805a79334f30132c430f00cb6ffe5b6be"
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
