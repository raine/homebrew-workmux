class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.244"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.244/workmux-darwin-arm64.tar.gz"
      sha256 "f37953dcf0c20c97ed35992838127da15aca0f5269728dbb2bac96e416d47707"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.244/workmux-darwin-amd64.tar.gz"
      sha256 "7a82b8154e9d77297d4e7df050dc10335d1817905f755ef9da5ed36af7cd9d0a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.244/workmux-linux-arm64.tar.gz"
      sha256 "5a282a55a004f3786b5b701043ace92cfe51b823875e21ff8db4f07ea89724cd"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.244/workmux-linux-amd64.tar.gz"
      sha256 "5495197c4051c6b8cfd64949abc4a801088764e4a3ded642472b35d8f752acc0"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
