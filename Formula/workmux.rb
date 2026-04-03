class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.176"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.176/workmux-darwin-arm64.tar.gz"
      sha256 "dd56d8c6dd23520f9e27854e3f3ddadcd609c5ac043e9dd5b0b35f7c950aa3df"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.176/workmux-darwin-amd64.tar.gz"
      sha256 "273bc8a9d00812a079b47edbf575930cdf3de4b77148a5dcb1c99a25716e3d2e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.176/workmux-linux-arm64.tar.gz"
      sha256 "178290db08644a02221f7fb2aa798fdc6fbba9a43b3406c75c864e1d45d78ab0"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.176/workmux-linux-amd64.tar.gz"
      sha256 "355ddcbfde311fec32eabc51eeea3021732f7dd88a538b6c49ff9ffd770d4e80"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
