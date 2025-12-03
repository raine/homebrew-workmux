class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.40/aarch64-apple-darwin.tar.gz"
      sha256 "8f1e23960532c5d1c98f1e62fa39734b2d98551804e5d4ed7f427890d75ea18f"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.40/x86_64-apple-darwin.tar.gz"
      sha256 "eeb6bb6e56722babdcafd690684727552d540df1da1280d17b541c18cddb6446"
    end
  end

  on_linux do
    url "https://github.com/raine/workmux/releases/download/v0.1.40/x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a72898409962fb5e27a8e821ae30ea2660d2ca2aea4bcad9f26e1a0c3182148d"
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
