class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.44"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.44/aarch64-apple-darwin.tar.gz"
      sha256 "40891d6e1a40f537c1be6cab86d29a20fda043c1b14a1270fe2610f7cbf9ed68"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.44/x86_64-apple-darwin.tar.gz"
      sha256 "3ceea5e66f4991a017a6d9dcec608784b7d73d115080c2f63575f3ef44f2efb7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.44/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8bc7926109dd8ef2d65852cc35f4a82b134ca3bb214afdf56312a8d4dc1d4c3a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.44/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "21af8a58da4c4e353542889caeef8064d7d3dd9c55415779ca2e4c56fd154b0a"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
