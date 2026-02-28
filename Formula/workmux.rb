class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.126"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.126/workmux-darwin-arm64.tar.gz"
      sha256 "13130b574e2db3c077f910e54011bc9804566ff4d7496cede390fc8e7c0b00a6"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.126/workmux-darwin-amd64.tar.gz"
      sha256 "b0f603ac717f506071f48f80f4dcc63ff675159c5ae421f19567def2ceaf9688"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.126/workmux-linux-arm64.tar.gz"
      sha256 "15a561e60fb5ad2a885c9bcc2645edfef663e381aa927e37d99a42b3df0290b9"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.126/workmux-linux-amd64.tar.gz"
      sha256 "42bf647ed9790718da218cf569b743f94cc62ab7a43bfe73f4833b4869e3ee95"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
