class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.274"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.274/workmux-darwin-arm64.tar.gz"
      sha256 "86e7b84698ca8b7c2a9ef6710da41ba5da506574d9a10b2c63803906574332b2"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.274/workmux-darwin-amd64.tar.gz"
      sha256 "ea2980c51765a28425040e5b6fe159050b2e4096dba8b167eda6d40ff1954e4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.274/workmux-linux-arm64.tar.gz"
      sha256 "d79afe1483c912378cb632a2b6dbc675b846d365898f12577eada9cfcf8def1d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.274/workmux-linux-amd64.tar.gz"
      sha256 "ba0779de33cee18f7bf1e9631bd23edae2606fc0e0cf670e96b3d954123af35c"
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
