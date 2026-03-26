class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.153"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.153/workmux-darwin-arm64.tar.gz"
      sha256 "157096877ee5a78dfd95f339d713428b31a1eeb176cd66c92a3ff280cc0e92fa"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.153/workmux-darwin-amd64.tar.gz"
      sha256 "40f4ceab387c45759777d9caa72b59e15eb51084fdd8ec4932996349d36ef16e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.153/workmux-linux-arm64.tar.gz"
      sha256 "341f3f4e07636648d3e1f8b2d7bc3b52079e2a1567346005f9ee2ca305f082a5"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.153/workmux-linux-amd64.tar.gz"
      sha256 "f3bc62b4aa0008daab266789d83b15daaf0417f5be1cd17098361aca13e489e1"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
