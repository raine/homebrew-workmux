class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.87"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.87/workmux-darwin-arm64.tar.gz"
      sha256 "13327130c74221d23e36b5ecc10bd94bc0f42f84288311390194271ca5303497"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.87/workmux-darwin-amd64.tar.gz"
      sha256 "ac1151aa41871cf15499fabda159570206e3d861b41509614fa552d747f43471"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.87/workmux-linux-arm64.tar.gz"
      sha256 "00731557deb2f23128845eba0e99a9efa39e8ffd300c6b4addd1ee068a3f53c5"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.87/workmux-linux-amd64.tar.gz"
      sha256 "907880e11f7b969fa5489ad475a4036ebfdb20692abe34aafa26479ccd3ee293"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
