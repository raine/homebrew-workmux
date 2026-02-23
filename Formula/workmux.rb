class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.122"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.122/workmux-darwin-arm64.tar.gz"
      sha256 "6ace3fb6b6169fdd602fb1ac635ec28f361ccd16d19bc61004318605d2a170b1"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.122/workmux-darwin-amd64.tar.gz"
      sha256 "478e517bf767ff3b6e1c9511ad66b55cf3bd3e9778db3df5c949a5b70b9f9c1f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.122/workmux-linux-arm64.tar.gz"
      sha256 "f5900076da1ff2733b8c08fe7b1128b4851e26acd868ae6d75e55438cb87cac9"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.122/workmux-linux-amd64.tar.gz"
      sha256 "7ab566bb8c1a742f778495dc4e466f69cd4638f4e96ecd07a41b800a3691f162"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
