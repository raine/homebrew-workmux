class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.148"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.148/workmux-darwin-arm64.tar.gz"
      sha256 "713f2a0f84a37b5357c206df615d64429f4380ed797c85385d8ba9b7d13efd92"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.148/workmux-darwin-amd64.tar.gz"
      sha256 "0bc707579cbb22a63d705dd12bd64bf6dd3c81197a3f90f8300cc7994554e13d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.148/workmux-linux-arm64.tar.gz"
      sha256 "c33c9afe949ce9024c094e22de2ab63956c8ca5b2fa5e5c964b9acd99eb468e7"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.148/workmux-linux-amd64.tar.gz"
      sha256 "28f66316a8adb99c0f7413a3a3d7879f9668caa17c969dd6afbbc5be836aee60"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
