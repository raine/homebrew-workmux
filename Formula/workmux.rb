class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.267"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.267/workmux-darwin-arm64.tar.gz"
      sha256 "659ce96235d50e4e6bafb1de18b3708bed87226459f9d684781107ff59a9b32f"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.267/workmux-darwin-amd64.tar.gz"
      sha256 "f68ea991ae5aadb1606199143b10ca1e078bd8f0c5a1f76a441833c84d85e657"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.267/workmux-linux-arm64.tar.gz"
      sha256 "44324ed5059315ad3c9e5552aeabebc527e0cf38a5cbbab6d310594a429a67b1"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.267/workmux-linux-amd64.tar.gz"
      sha256 "e9dcae5a8c44583f2000b1b75086da8ef3017295b4a0cd70f5c4abbc20dab7a9"
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
