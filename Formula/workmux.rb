class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.243"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.243/workmux-darwin-arm64.tar.gz"
      sha256 "0e2a63479f2797345d7cc55ffa55d41da9c0edad06ae5f53164f38e19687d074"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.243/workmux-darwin-amd64.tar.gz"
      sha256 "35981c545679433dcd9677479b1a6af0dcce9e07dfbad457ad7a1ef7818899fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.243/workmux-linux-arm64.tar.gz"
      sha256 "7ec3839e811fbc64feeac16f17f85d44f04b60c5ad54b6ba4ae107220968ed0d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.243/workmux-linux-amd64.tar.gz"
      sha256 "b7727ebfa2e37e6758171a1af06012b8d5c75f1ac457cb4ec1f8eb53c147b586"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
