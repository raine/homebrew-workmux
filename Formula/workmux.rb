class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.58"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.58/aarch64-apple-darwin.tar.gz"
      sha256 "f1a41847c3fe5620bacc9b1ed39f3e8b75775abd204073a4edde0168d0497b9a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.58/x86_64-apple-darwin.tar.gz"
      sha256 "95f6df77b92b27533ee660db0f66efb1668d07975b5475b7f8933537d02fafa1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.58/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da014c0887ed920ef33778ecdba7bff415d7c99aed7cd3cb9e4d807cdf7f4ec2"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.58/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e2ff7797b9139a352de1029ae110ed0ca6089f286c3dbb487b186d0aee4539df"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
