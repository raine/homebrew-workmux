class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.280"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.280/workmux-darwin-arm64.tar.gz"
      sha256 "caabbe4bc8c8d1436f139e791b1ca8cee70a2e020edc84c18f3ca42bf4b8cc0b"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.280/workmux-darwin-amd64.tar.gz"
      sha256 "30fad28c51a287c5ac57181fa8551c12259213047804f798d4dce64d040c101d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.280/workmux-linux-arm64.tar.gz"
      sha256 "7a7bb42e1d864a54dd167bdac032ed650875f9dd776ad4720946733d1edbca99"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.280/workmux-linux-amd64.tar.gz"
      sha256 "36b942d6f6034a5de14f8eb5dd2effc408558bf7415d34fb1e3b200e8d8026ea"
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
