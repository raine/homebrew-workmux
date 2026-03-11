class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.136"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.136/workmux-darwin-arm64.tar.gz"
      sha256 "9099f06949aea8970b72fe802ba9b78d02cc5e83ef2b1bf0be2e37826b105f1e"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.136/workmux-darwin-amd64.tar.gz"
      sha256 "cb7dc527ff8364ea2171a9458b2885d74cc886b556f54cad0ed8400128af9a2a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.136/workmux-linux-arm64.tar.gz"
      sha256 "44420413af62b037c3fc23135384908850b1b747769d58b8c5f67088d51ac027"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.136/workmux-linux-amd64.tar.gz"
      sha256 "760a0748fc1d8f797594ca0cbc223a6208b5131020f7ecfa33060f0836c8f172"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
