class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.145"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.145/workmux-darwin-arm64.tar.gz"
      sha256 "da37405b7091ae5ae4a062f78d8e19e0c9b4fd8e12707ec642b5ee5f37d690c2"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.145/workmux-darwin-amd64.tar.gz"
      sha256 "64d05383dc91f4b440748ef7907b1f6b71a4b041854f1859005939cb7e1358db"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.145/workmux-linux-arm64.tar.gz"
      sha256 "c357373b18f29800e51b8151965abc0ee5590d7caec182f7943019847d4de245"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.145/workmux-linux-amd64.tar.gz"
      sha256 "912f407e825b19dd499db468e470ed2142b413d4bced89759dd637347415fb4e"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
