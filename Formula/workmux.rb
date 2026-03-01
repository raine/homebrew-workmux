class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.128"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.128/workmux-darwin-arm64.tar.gz"
      sha256 "071ce9b6d2b59f4c23910d9d1b9d8e4b6f08356a0217335897ffc6ea7ee67ae7"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.128/workmux-darwin-amd64.tar.gz"
      sha256 "b667b76f45a303262a66621778e6923d8d31534d263d055385d577e919e0f3d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.128/workmux-linux-arm64.tar.gz"
      sha256 "1c3f25dc74d157462af8ad3fce05612a51648fb3f55bf0fef50ca6f7a7ab715e"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.128/workmux-linux-amd64.tar.gz"
      sha256 "b015dc842adccfaf4991ea990dd9633b62a54f5b2f35c24d8e0b8386bab13d7e"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
