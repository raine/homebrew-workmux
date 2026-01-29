class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.101"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.101/workmux-darwin-arm64.tar.gz"
      sha256 "3c9e1daf222fe4f9a16e16ef825d47132e55c755eb5c81d0a145c568c913a35d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.101/workmux-darwin-amd64.tar.gz"
      sha256 "7d19b26fc1359212ff85c67d85666e37b26639885f3b2ef818ca67900a578214"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.101/workmux-linux-arm64.tar.gz"
      sha256 "2510b67a475696f57ec8d03270a8b92eaaa085434037649964d9218f898a3235"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.101/workmux-linux-amd64.tar.gz"
      sha256 "506a01787a0aef6d54ea8e72c2dbcbefc6693388e333e09f74f16c5a9cf58f14"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
