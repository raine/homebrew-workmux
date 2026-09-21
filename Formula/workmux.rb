class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.264"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.264/workmux-darwin-arm64.tar.gz"
      sha256 "9182ac22732ff8198704b82ac26ab92965b94214c8f91fdeca21c36f71f00ee9"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.264/workmux-darwin-amd64.tar.gz"
      sha256 "96e7925ac12037e546d82fabf5bf5de5879db6086bc3a08ace3f98da7f84b123"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.264/workmux-linux-arm64.tar.gz"
      sha256 "06c309211a2247f3b15b8b285f112b472c99a7fcbce25042e8756467880e3330"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.264/workmux-linux-amd64.tar.gz"
      sha256 "a3d173c5f44d886fa6b3815dbdb6ce653e659db376fe48fa93db71bf40d11655"
    end
  end

  def install
    bin.install "workmux"
    generate_completions_from_executable(bin/"workmux", "completions")
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
