class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.191"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.191/workmux-darwin-arm64.tar.gz"
      sha256 "d1c165b81de4ebcbe6ff27f4856beabc03c77959af6161f580dbc0e72d535b5a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.191/workmux-darwin-amd64.tar.gz"
      sha256 "4de23b630edd18165179c7b798feefb93d662e2206fbd664a7fad134c1df1d39"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.191/workmux-linux-arm64.tar.gz"
      sha256 "f29596e4f598e0a8ea94591991556ab8025d115ca9cbd359b0adf52f7666da9f"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.191/workmux-linux-amd64.tar.gz"
      sha256 "71fd1bdf864689662b6f0d57f8d4ea4377a3c1725e1806cb18dcbf75584778e0"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
