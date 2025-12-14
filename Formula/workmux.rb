class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.49"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.49/aarch64-apple-darwin.tar.gz"
      sha256 "628aa825bc51d2dd2cba090bb75b797bbc4ff71c96e268f8a6d8538292ab6c3d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.49/x86_64-apple-darwin.tar.gz"
      sha256 "e79801ce70f14eabc0ca6f95b225fca6236a96c9b0cf80448fa15457c913fb44"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.49/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e63eb985f118b6f0957c459e6a36888d98fdddcd493073267d01ad6f9e9e524c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.49/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ceb1c2cfa2b80bce5fbaecbd4e764105420ad701a843e0c49357ff161a696c15"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
