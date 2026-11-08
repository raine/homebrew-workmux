class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.281"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.281/workmux-darwin-arm64.tar.gz"
      sha256 "ce68622c42088671731d539cc404b7e45138db304d9f55a84c285bf1bfccc491"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.281/workmux-darwin-amd64.tar.gz"
      sha256 "ddc75bfb9b5fb4f6e58028ba8e65d7081711a47b120ee7df22d80ba0a0a0d8c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.281/workmux-linux-arm64.tar.gz"
      sha256 "ab76f26530ab644b11f6a15dd88cbd8276d018f00033e774098ca650e454e625"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.281/workmux-linux-amd64.tar.gz"
      sha256 "8953b10047a293e35bdce6f71faab42bd34a613fac9244a2fe2c995ad45741cc"
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
