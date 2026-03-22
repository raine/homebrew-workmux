class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.144"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.144/workmux-darwin-arm64.tar.gz"
      sha256 "1e1edc631fe98707b47a7473346bc4de15bc75ab8c1c46b159231bd5430e3429"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.144/workmux-darwin-amd64.tar.gz"
      sha256 "8b6f9942a85fc9630e3738cbf3b39de43af0a800fa67bab31b70719520f4840b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.144/workmux-linux-arm64.tar.gz"
      sha256 "e679669c2dd17fd2d15701627b6655cefb4971220db1b715de3c1b307ff6cd7a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.144/workmux-linux-amd64.tar.gz"
      sha256 "29244441473ce30db1039cf4fcf16d1c51e309aaee33c070d6a6ddcb26cde51c"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
