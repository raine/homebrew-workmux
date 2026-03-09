class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.133"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.133/workmux-darwin-arm64.tar.gz"
      sha256 "5c249d5e99f46594e0182de794d376239b8f55c603ae5dbb89a75622f4f315d8"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.133/workmux-darwin-amd64.tar.gz"
      sha256 "0cf934867231d4274b4b797c4d678c83f9487f234296bb822fa4fa217157a833"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.133/workmux-linux-arm64.tar.gz"
      sha256 "6acaa7d2fa78ab2b11061686ba2748a133772d4b4192bbef3e0f0dd52f0de03f"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.133/workmux-linux-amd64.tar.gz"
      sha256 "56f06dc0e988f77a51dfc8a641c152c3166c9aaf0bd27183921dc6cfbc905e20"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
