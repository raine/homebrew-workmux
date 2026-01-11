class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.84"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.84/workmux-darwin-arm64.tar.gz"
      sha256 "8e1c92079c1a323f70dc5d27347f47ced1d2597c0631553f77f2a32792eca63a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.84/workmux-darwin-amd64.tar.gz"
      sha256 "7b25f44a78498e4d17b5c86ba88007ea55f392dafa0d4cd9a491ce720b00c14a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.84/workmux-linux-arm64.tar.gz"
      sha256 "c2c1685f38d43d54b11ca3f8c1697d8d1ba41bfa4d5aef2d1c5c2c34c55725da"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.84/workmux-linux-amd64.tar.gz"
      sha256 "26dc0aef4ad00e906a96818625790f31ba8dcbb04348f31972f9f5df898c4f87"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
