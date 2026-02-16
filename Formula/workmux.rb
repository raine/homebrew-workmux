class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.117"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.117/workmux-darwin-arm64.tar.gz"
      sha256 "528a4035eee6e8393caa8972e9e7b03a661c0e9f3d9f57314ef205525ed0f802"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.117/workmux-darwin-amd64.tar.gz"
      sha256 "c3501f0a9d85123e3f312a8acfb1684941ebad86e03faf4d5c32e8993b981c1a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.117/workmux-linux-arm64.tar.gz"
      sha256 "84a6661d08f5dea96b46feda114ac2f197c89dfb423d25f8b9ef0ee5eedc166f"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.117/workmux-linux-amd64.tar.gz"
      sha256 "41d6b1e4b98fbf24db45f4cba8937a5400ace4e6a3f8e6aa1b35062c0374677e"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
