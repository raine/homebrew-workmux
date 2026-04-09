class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.180"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.180/workmux-darwin-arm64.tar.gz"
      sha256 "cd1541bbd06b7f610661f67db57de9881bad0aad8008ffbcdef120f0289e4e6a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.180/workmux-darwin-amd64.tar.gz"
      sha256 "f15dc2249dd5ee79999e63ec67b3965f8853510ac22741ae048947f2e1777090"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.180/workmux-linux-arm64.tar.gz"
      sha256 "ddc6ed128c59ca03e7370cce0699ba5824bc3fe1ce7ef94bf8da4efb13350122"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.180/workmux-linux-amd64.tar.gz"
      sha256 "1ee75948090d0175d21b14da2435f954157318c625c3985aba74b3656294eed0"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
