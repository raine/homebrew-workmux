class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.29/aarch64-apple-darwin.tar.gz"
      sha256 "014d5368281c91791cff8d15d2ee4c321967f87a794f5f69b40f1a359a96295d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.29/x86_64-apple-darwin.tar.gz"
      sha256 "9ea86d4c6b65fbacbbf443005a96f325ac3c026d347b325e4c6f27a3bcc23647"
    end
  end

  on_linux do
    url "https://github.com/raine/workmux/releases/download/v0.1.29/x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0bb539db4a0d4895b585a96a5b9a5abe12a65ad629e19ade0139fb0c321f5448"
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
