class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.116"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.116/workmux-darwin-arm64.tar.gz"
      sha256 "ff8d250f5c82a4bc57731e3a108b924f88580e3a6c2e17148671430eb0b6a9db"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.116/workmux-darwin-amd64.tar.gz"
      sha256 "7b85bcf3a1697976683e2020f97303c16989ace6ef38eeb1a00c9b7b935bd8ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.116/workmux-linux-arm64.tar.gz"
      sha256 "4329bc0eacfa7fb9d79c2eab3e1e01b7d608ac34c96c4dd977fcc6bcaaca898e"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.116/workmux-linux-amd64.tar.gz"
      sha256 "400b39ef545981d735a05c8caff90b66f5f642f4110d26b85d313f4f9181e886"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
