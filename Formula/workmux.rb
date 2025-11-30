class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.35"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.35/aarch64-apple-darwin.tar.gz"
      sha256 "c397a03d08c892847ac3f66a1724802ccce428ed5b6cda796ae2a9732fa35b1d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.35/x86_64-apple-darwin.tar.gz"
      sha256 "ffd7b141589a47efe406e76ced6cff47b3f5508c519c125044d0f580a94336be"
    end
  end

  on_linux do
    url "https://github.com/raine/workmux/releases/download/v0.1.35/x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e1febec0085a11624eb7d8e95944c77cce889b7a54fe369514f146575c0c4ad2"
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
