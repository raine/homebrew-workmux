class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.107"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.107/workmux-darwin-arm64.tar.gz"
      sha256 "5a61fc93b3959149da105d01a558f0aad027117f4137585abe64ff76e7d32f1e"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.107/workmux-darwin-amd64.tar.gz"
      sha256 "95255fcfc42553b42839fa0f2bf64f1ca4910a569ba4b4fec99f51ade2e2450a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.107/workmux-linux-arm64.tar.gz"
      sha256 "a116504cc8b8164ebc77b7548fb72b5482c5ebae7c4ccd6dacc6d51e8612caa4"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.107/workmux-linux-amd64.tar.gz"
      sha256 "c9a2d7c975ddc4b7e676893c82a757065e949a6f86708a017759dacfd7af2cb0"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
