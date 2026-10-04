class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.271"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.271/workmux-darwin-arm64.tar.gz"
      sha256 "9471ebaa121629a4c48fa5111e3dcba26c3dca80776082ae1d57475a60b14448"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.271/workmux-darwin-amd64.tar.gz"
      sha256 "fd8e2edb964e0a9488814c1cdfb93d085712e61ca43ae21cc7fb127311b9d931"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.271/workmux-linux-arm64.tar.gz"
      sha256 "154d95ff421b3ce68105aabf308ce127f2f2a5a31d2d0639fbb60ba1046c5261"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.271/workmux-linux-amd64.tar.gz"
      sha256 "471ff99640a3963e4ff034fa232dbcea38dbd0b47aea50df4bb4579c19bdbb01"
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
